# Example: Code Complexity Reduction

Real-world example demonstrating the `complexity-reducer` agent on a Python project with dependency tracking.

---

## Scenario

You have inherited a Python project with several files exceeding 1000 lines, making maintenance difficult. You need to systematically refactor the codebase while ensuring no dependencies break.

**Project Structure:**
```
medical_app/
├── medical_graphrag_library.py  (3500 lines) ⚠️
├── data_processor.py           (1200 lines) ⚠️
├── api_endpoints.py            (800 lines)
├── utils.py                    (600 lines) ⚠️
└── tests/
    └── test_medical.py         (400 lines)
```

---

## Conversation

### User Request

```
I have a medical AI project with files that have grown too large. The main library
is 3500 lines, and I'm having trouble maintaining it. Can you analyze the entire
codebase and reduce complexity while tracking all dependencies?
```

### Agent Response

```
I'll use the complexity-reducer agent to perform comprehensive complexity analysis
and refactoring with Neo4j dependency tracking.

Let me launch the complexity-reducer agent to analyze your codebase, create
timestamped Neo4j databases for before/after states, and systematically refactor
oversized modules while ensuring all dependencies remain intact.
```

---

## Agent Process (Behind the Scenes)

### Step 1: Generate Timestamp

```python
from datetime import datetime
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
# Result: "20251016_143022"

before_db = "before_20251016_143022"
after_db = "after_20251016_143022"
```

### Step 2: Create Neo4j Databases

Using Neo4j MCP tool, the agent executes:

```cypher
CREATE OR REPLACE DATABASE before_20251016_143022;
CREATE OR REPLACE DATABASE after_20251016_143022;
```

### Step 3: Analyze Dependencies (Before State)

Agent switches to `before_20251016_143022` database and executes:

```cypher
USE before_20251016_143022;

// Create module nodes
CREATE (m1:Module {
  name: 'medical_graphrag_library',
  path: 'medical_app/medical_graphrag_library.py',
  lines: 3500,
  functions: 116,
  complexity: 'high'
});

CREATE (m2:Module {
  name: 'data_processor',
  path: 'medical_app/data_processor.py',
  lines: 1200,
  functions: 24,
  complexity: 'medium'
});

// Create function nodes and dependencies
CREATE (f1:Function {
  name: 'MedicalGraphRAG.__init__',
  module: 'medical_graphrag_library',
  lines: 45,
  calls: ['MedicalGraphDB', 'OllamaClient', 'initialize_database']
});

// Create IMPORTS relationships
MATCH (m1:Module {name: 'data_processor'})
MATCH (m2:Module {name: 'medical_graphrag_library'})
CREATE (m1)-[:IMPORTS {symbols: ['MedicalEntityExtractor', 'QueryProcessor']}]->(m2);

// ... (continues for all modules and functions)
```

### Step 4: Analyze and Plan Refactoring

Agent identifies:
- `medical_graphrag_library.py` (3500 lines) → Split into 7 modules (~500 lines each)
- `data_processor.py` (1200 lines) → Split into 3 modules (~400 lines each)
- `utils.py` (600 lines) → Split into 2 modules (~300 lines each)

**Planned Module Structure:**
```
medical_app/
├── core/
│   ├── graph_db.py           (~500 lines) - Neo4j operations
│   ├── entity_extractor.py   (~500 lines) - Entity extraction
│   ├── relationship_extractor.py (~450 lines) - Relationship extraction
│   ├── query_processor.py    (~480 lines) - Query processing
│   ├── evidence_grader.py    (~420 lines) - Evidence grading
│   ├── llm_client.py         (~400 lines) - LLM interface
│   └── medical_graphrag.py   (~250 lines) - Main class (orchestrator)
├── processing/
│   ├── document_parser.py    (~400 lines) - Document processing
│   ├── batch_processor.py    (~400 lines) - Batch operations
│   └── cache_manager.py      (~400 lines) - Cache operations
├── utils/
│   ├── config.py             (~300 lines) - Configuration
│   └── helpers.py            (~300 lines) - Helper functions
├── api_endpoints.py          (800 lines) - Unchanged
└── tests/
    └── test_medical.py       (400 lines) - Unchanged
```

### Step 5: Execute Refactoring

Agent creates each new module, carefully extracting code and updating imports.

**Example: Creating `core/entity_extractor.py`**

```python
"""
Medical Entity Extraction Module

Extracted from medical_graphrag_library.py for improved maintainability.
Date: 2025-10-16
"""

import spacy
from typing import List, Dict, Tuple, Optional
from .llm_client import OllamaClient  # Updated import
from ..utils.config import Config     # Updated import

class MedicalEntityExtractor:
    """Extracts medical entities from text using spaCy and Ollama."""

    def __init__(self, config: Config):
        self.config = config
        self.nlp = spacy.load("en_core_web_sm")
        self.llm_client = OllamaClient(config)

    # ... (500 lines of entity extraction code)
```

### Step 6: Update All Import Statements

Agent updates every file that imported from the original modules:

**Before:**
```python
from medical_graphrag_library import MedicalEntityExtractor, QueryProcessor
```

**After:**
```python
from medical_app.core.entity_extractor import MedicalEntityExtractor
from medical_app.core.query_processor import QueryProcessor
```

### Step 7: Record After State in Neo4j

Agent switches to `after_20251016_143022` database:

```cypher
USE after_20251016_143022;

// Create new module structure
CREATE (m1:Module {
  name: 'entity_extractor',
  path: 'medical_app/core/entity_extractor.py',
  lines: 500,
  functions: 15,
  complexity: 'low'
});

CREATE (m2:Module {
  name: 'query_processor',
  path: 'medical_app/core/query_processor.py',
  lines: 480,
  functions: 12,
  complexity: 'low'
});

// ... (continues for all new modules)

// Create new dependencies
MATCH (m1:Module {name: 'entity_extractor'})
MATCH (m2:Module {name: 'llm_client'})
CREATE (m1)-[:IMPORTS {symbols: ['OllamaClient']}]->(m2);
```

### Step 8: Verify Refactoring

Agent runs tests to ensure nothing broke:

```bash
pytest tests/ -v

# Results:
# test_medical.py::test_entity_extraction PASSED
# test_medical.py::test_query_processing PASSED
# test_medical.py::test_graph_operations PASSED
# ... (all tests pass)
```

### Step 9: Generate Reconciliation Report

Agent queries both databases to compare:

```cypher
// Compare module counts
USE before_20251016_143022;
MATCH (m:Module) RETURN count(m) as before_count;
// Result: 5 modules

USE after_20251016_143022;
MATCH (m:Module) RETURN count(m) as after_count;
// Result: 12 modules

// Compare total lines
USE before_20251016_143022;
MATCH (m:Module) RETURN sum(m.lines) as before_lines;
// Result: 6100 lines

USE after_20251016_143022;
MATCH (m:Module) RETURN sum(m.lines) as after_lines;
// Result: 6150 lines (50 lines of new imports/docstrings)

// Verify all dependencies are preserved
USE before_20251016_143022;
MATCH (m1)-[r:IMPORTS]->(m2)
RETURN m1.name, r.symbols, m2.name;

USE after_20251016_143022;
MATCH (m1)-[r:IMPORTS]->(m2)
RETURN m1.name, r.symbols, m2.name;
// Agent verifies all original dependencies exist in refactored code
```

---

## Agent Output

```
🔍 COMPLEXITY REDUCTION COMPLETE

TIMESTAMP: 20251016_143022

NEO4J DATABASES:
  Before: before_20251016_143022
  After:  after_20251016_143022

REFACTORING SUMMARY:

Original Structure:
  - 5 modules
  - 6,100 total lines
  - 3 files >500 lines (medical_graphrag_library: 3500, data_processor: 1200, utils: 600)
  - Average file size: 1,220 lines

Refactored Structure:
  - 12 modules
  - 6,150 total lines (50 lines added for imports/docs)
  - 0 files >500 lines
  - Largest file: 500 lines (entity_extractor.py)
  - Average file size: 512 lines

MODULES CREATED:
  core/
    ✓ graph_db.py (500 lines)
    ✓ entity_extractor.py (500 lines)
    ✓ relationship_extractor.py (450 lines)
    ✓ query_processor.py (480 lines)
    ✓ evidence_grader.py (420 lines)
    ✓ llm_client.py (400 lines)
    ✓ medical_graphrag.py (250 lines)

  processing/
    ✓ document_parser.py (400 lines)
    ✓ batch_processor.py (400 lines)
    ✓ cache_manager.py (400 lines)

  utils/
    ✓ config.py (300 lines)
    ✓ helpers.py (300 lines)

DEPENDENCY RECONCILIATION:
  ✓ All 47 original dependencies preserved
  ✓ No circular dependencies detected
  ✓ All imports updated correctly
  ✓ All tests pass (23/23)

VERIFICATION:
  ✓ pytest: All tests pass
  ✓ No broken imports
  ✓ No undefined symbols
  ✓ Type hints preserved

NEXT STEPS:
  1. Review refactored code structure
  2. Update documentation to reflect new module organization
  3. Consider adding module-level tests for new files
  4. Query Neo4j databases to explore dependency graph:
     - Browser: http://localhost:7474
     - Use databases: before_20251016_143022, after_20251016_143022
```

---

## Exploring the Results

### View Dependency Graph in Neo4j Browser

1. Open Neo4j Browser: `http://localhost:7474`
2. Switch to before database:
   ```cypher
   :use before_20251016_143022
   ```
3. Visualize all modules and dependencies:
   ```cypher
   MATCH (m1:Module)-[r:IMPORTS]->(m2:Module)
   RETURN m1, r, m2
   ```

4. Compare with after database:
   ```cypher
   :use after_20251016_143022

   MATCH (m1:Module)-[r:IMPORTS]->(m2:Module)
   RETURN m1, r, m2
   ```

### Query Examples

**Find modules that were split:**
```cypher
USE before_20251016_143022;
MATCH (m:Module)
WHERE m.lines > 500
RETURN m.name, m.lines
ORDER BY m.lines DESC;

// Results:
// medical_graphrag_library, 3500
// data_processor, 1200
// utils, 600
```

**Verify no circular dependencies in refactored code:**
```cypher
USE after_20251016_143022;

MATCH path = (m1:Module)-[:IMPORTS*]->(m1)
RETURN path;

// Returns: (no rows) ✓ No circular dependencies
```

**Find most-imported modules:**
```cypher
USE after_20251016_143022;

MATCH (m:Module)<-[:IMPORTS]-(importer)
RETURN m.name, count(importer) as import_count
ORDER BY import_count DESC
LIMIT 5;

// Results:
// llm_client, 8
// config, 7
// graph_db, 6
// helpers, 5
// entity_extractor, 4
```

---

## Verification with honest-broker

After refactoring, always verify:

```
User: "Use the honest-broker agent to verify the refactoring is complete and production-ready"
```

Agent response:
```
🔍 HONEST BROKER ASSESSMENT

CLAIM BEING VERIFIED:
"Complexity reduction is complete and all dependencies are preserved"

VERDICT: CONFIRMED ✓

FINDINGS:
✓ All 3 oversized files successfully refactored (medical_app/core/*, medical_app/processing/*)
✓ No files exceed 500-line limit
✓ All 47 dependencies tracked in Neo4j before_20251016_143022 database
✓ All 47 dependencies verified in after_20251016_143022 database
✓ pytest shows 23/23 tests passing
✓ No TODO or FIXME markers in refactored code
✓ All modules have proper docstrings
✓ Type hints preserved throughout

REMAINING WORK:
None - refactoring is complete

PRODUCTION READINESS: 95%

REASONING:
- Code quality significantly improved
- All functionality preserved (tests pass)
- Dependencies properly tracked
- Minor recommendation: Add integration tests for new module boundaries

RECOMMENDATION:
Proceed to production. Consider adding module-level integration tests in next sprint.
```

---

## Key Takeaways

1. **Timestamped Databases**: `before_YYYYMMDD_HHMMSS` and `after_YYYYMMDD_HHMMSS` prevent contamination and allow historical comparison

2. **Dependency Tracking**: Neo4j graph database ensures no imports break during refactoring

3. **Systematic Refactoring**: Agent breaks large files into logical modules (~500 lines each)

4. **Verification is Critical**: Always use `honest-broker` to verify completion claims

5. **MCP Tools Enable This**: Without Neo4j MCP, agent would have to write Python code instead of directly executing Cypher queries

---

## Files Changed

```
Created:
  medical_app/core/graph_db.py
  medical_app/core/entity_extractor.py
  medical_app/core/relationship_extractor.py
  medical_app/core/query_processor.py
  medical_app/core/evidence_grader.py
  medical_app/core/llm_client.py
  medical_app/core/medical_graphrag.py
  medical_app/processing/document_parser.py
  medical_app/processing/batch_processor.py
  medical_app/processing/cache_manager.py
  medical_app/utils/config.py
  medical_app/utils/helpers.py

Deleted:
  medical_app/medical_graphrag_library.py
  medical_app/data_processor.py
  medical_app/utils.py

Modified:
  medical_app/api_endpoints.py (import statements updated)
  tests/test_medical.py (import statements updated)

Neo4j Databases Created:
  before_20251016_143022
  after_20251016_143022
```

---

**Next Example**: [02_graphrag_system_design.md](02_graphrag_system_design.md) - Designing a complete GraphRAG system with multiple agents
