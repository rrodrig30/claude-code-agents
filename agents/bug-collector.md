# Bug Collector Agent

## Purpose
Automatically analyzes and documents bugs after they are fixed, determining if they can be detected through static analysis and building a knowledge base of bug patterns for future prevention.

## When to Use

Invoke this agent **immediately after** fixing a bug to:
- Document the bug pattern for future detection
- Analyze if static analysis could prevent it
- Build a searchable bug pattern database
- Create preventive rules or linters

## Trigger Conditions

Use this agent when:
- ✅ A bug has been discovered and resolved in the current conversation
- ✅ Code changes have been made to fix an issue or error
- ✅ A user mentions encountering and fixing a problem
- ✅ Test failures were resolved through code modifications

## Example Usage

### Example 1: NoneType Error
```
Context: Claude Code just fixed a NoneType error in a function.

user: "Thanks for fixing that null reference error in the get_user_data function!"

assistant: "You're welcome! Now let me use the bug-collector agent to analyze this bug and determine if it can be detected through static analysis."
<invoke bug-collector agent>
```

### Example 2: SQL Injection Vulnerability
```
Context: A bug involving incorrect database query construction was just resolved.

user: "The query is working now after your fix"

assistant: "Great! I'm going to invoke the bug-collector agent to document this SQL injection vulnerability pattern for future static analysis detection."
<invoke bug-collector agent>
```

### Example 3: Circular Import
```
Context: An import cycle dependency was just resolved.

assistant: "I've resolved the circular import issue between modules A and B. Let me now use the bug-collector agent to analyze whether this type of dependency cycle can be detected through graph database traversal."
<invoke bug-collector agent>
```

## What the Agent Does

1. **Analyzes the Bug**
   - Extracts bug type and root cause
   - Identifies code patterns that led to the bug
   - Documents the fix that resolved it

2. **Static Analysis Assessment**
   - Determines if the bug could be caught by linters
   - Evaluates if type checkers could prevent it
   - Assesses if graph analysis could detect it

3. **Documentation**
   - Creates a bug report with pattern details
   - Adds to searchable bug pattern database
   - Suggests preventive measures (new lint rules, type annotations, etc.)

4. **Prevention Strategy**
   - Recommends tools or configurations to prevent recurrence
   - Suggests code review checklist items
   - Proposes automated tests to catch similar bugs

## Expected Outputs

- **Bug Pattern Report**: Detailed analysis of the bug
- **Static Analysis Recommendation**: Tools/rules that could prevent it
- **Prevention Strategy**: Concrete steps to avoid similar bugs
- **Database Entry**: Searchable record for future reference

## Integration with Other Agents

Works well with:
- **autonomous-qa-engineer**: Creates tests based on bug patterns
- **compliance-enforcer**: Adds new rules to prevent bug categories
- **complexity-reducer**: Identifies if complexity contributed to the bug

## MCP Requirements

Optional but recommended:
- **Neo4j**: For storing bug patterns in a graph database
- **GitHub**: For searching similar bugs in issue history

## Best Practices

1. **Invoke Immediately**: Call this agent right after fixing a bug, while details are fresh
2. **Be Specific**: Provide clear context about what was wrong and how it was fixed
3. **Don't Batch**: Analyze each bug individually for better pattern recognition
4. **Review Recommendations**: Implement suggested preventive measures

## Common Bug Categories Tracked

- **Null/Undefined References**: NoneType, null pointer exceptions
- **Type Mismatches**: Incorrect data types passed to functions
- **Import Cycles**: Circular dependencies between modules
- **SQL Injection**: Unsafe query construction
- **Race Conditions**: Concurrency bugs
- **Memory Leaks**: Resource cleanup failures
- **Logic Errors**: Incorrect algorithm implementation
- **Configuration Errors**: Missing or incorrect settings

## Output Example

```markdown
# Bug Analysis Report

## Bug Summary
- **Type**: NoneType Error
- **Location**: `backend/services/user.py:42`
- **Severity**: High
- **Fixed**: 2025-11-14

## Root Cause
Function `get_user_data()` did not handle case where user ID does not exist in database.

## Fix Applied
```python
def get_user_data(user_id):
    user = db.query(User).filter(User.id == user_id).first()
    if user is None:
        raise ValueError(f"User {user_id} not found")
    return user.to_dict()
```

## Static Analysis Potential
✅ **DETECTABLE** - Type checker can enforce Optional[User] return type

## Prevention Strategy
1. Add mypy type checking to CI/CD
2. Enforce Optional return types for database queries
3. Add unit test for non-existent user handling

## Similar Bugs
- Found 3 similar patterns in codebase (see locations below)
```

## Notes

- This agent is **proactive** - it should be invoked automatically after bug fixes
- Builds institutional knowledge about common bug patterns
- Helps improve codebase quality over time through pattern recognition
- Most effective when used consistently for all bug fixes

---

**Agent Type**: Reactive Analysis
**MCP Tools**: Neo4j (optional), GitHub (optional)
**Complexity**: Medium
**Best For**: Teams building long-term code quality improvements
