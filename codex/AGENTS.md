Agents Guide
============

Scope

- This guide consolidates best practices and checklists for working across roles
(Build, Plan, Debug, Review, Refactor, Docs, Audit, Tester) and languages (Rust,
Python, React/React Native).
- Use these guidelines as shared operating procedures for consistent,
high‑quality work.

Roles

- Builder: Owns implementation, integration, and tests; delegates to
specialists as needed.
- Planner: Analyzes systems, defines architecture, plans migrations,
identifies risks.
- Debug: Reproduces, isolates, and fixes issues with root cause analysis and
regression tests.
- Review: Ensures code quality, maintainability, security, and performance
before merge.
- Refactor: Improves structure/readability/maintainability without changing behavior.
- Docs: Produces clear, accurate, copy‑pasteable documentation and guides.
- Audit: Identifies vulnerabilities and proposes concrete remediations.
- Tester: Creates comprehensive, maintainable tests with strong coverage
and edge cases.

Language Best Practices

- Rust
  - Embrace ownership/borrowing; prefer iterators over manual loops.
  - Use Result/Option with `?`; avoid `unwrap()` in production paths.
  - Define proper error types (e.g., `thiserror`); document safety for `unsafe`.
  - Run `cargo clippy` and `cargo fmt`; document public APIs with examples.
  - Performance: allocate with capacity, borrow `&str` vs `String`, minimize clones.
- Python
  - PEP 8 + type hints; explicit, specific exceptions; context managers.
  - Virtualenvs; docstrings with examples; prefer stdlib; black and mypy.
  - Performance: sets for membership, `"".join` for concatenation, generators
  for streams.
- React/React Native
  - Functional components + hooks; TypeScript; compose components.
  - Manage state thoughtfully (local vs Context/Redux); memoize with `memo`,
  `useMemo`, `useCallback`.
  - Correct `key` props; complete dependency arrays; accessibility;
  platform-specific organization.

Security Essentials

- Prioritize by severity
  - P0: RCE, auth bypass, privilege escalation, sensitive data exposure.
  - P1: XSS, insecure deserialization, path traversal, weak crypto, missing auth.
  - P2/P3: Info disclosure, weak policies, missing headers, outdated deps.
- Checklist
  - AuthN/Z: MFA, password policy, lockouts, session/JWT expiry, RBAC, key rotation.
  - Data: TLS in transit, encryption at rest, PII masking, key management,
  retention policies.
  - Input: Length/type limits, whitelists, file restrictions, parameterized SQL.
  - Headers: CSP, X-Frame-Options, X-Content-Type-Options, HSTS, Referrer-Policy.
- Dependency scanning: `cargo audit`, `cargo geiger`; `safety`, `pip-audit`,
`bandit`; `npm audit`, `snyk`.
- Secrets detection patterns
  - API keys, AWS AKIA..., private key blocks, password/token assignments.

Testing Strategy

- Pyramid: many unit, some integration, few E2E; target ≥80% coverage
(100% on critical paths).
- Rust: `#[cfg(test)]`, `rstest`, `proptest`, `tokio::test`; add regression
tests for bugs.
- Python: pytest, parametrization, mocks, async tests, property-based (hypothesis).
- React/Native: @testing-library, hooks testing, async state, snapshots, a11y checks.
- Quality checklist
  - Independent, deterministic, fast (mock I/O); clear AAA structure;
  verify behavior, not implementation.

Refactoring Guidelines

- Principles: preserve behavior, small steps, clear intent, reduce complexity,
follow standards.
- Rust: remove unnecessary clones; use `?` operator; collapse extra iterations
into a single chain.
- Python: list comprehensions, context managers, decompose large functions
into focused ones.
- React: extract components; extract custom hooks from component logic.
- Performance: prefer data-structure/algorithmic wins over micro-optimizations.

Code Review Checklist

- General
  - Naming/readability; DRY; single responsibility; cyclomatic complexity
  acceptable; code smells.
- Language-specific
  - Rust: ownership/borrowing, error handling, avoid clones, `derive` usage,
  unsafe justification.
  - Python: complete type hints, context managers, no mutable defaults,
  specific exceptions, PEP 8.
  - React: memoization, correct keys, effect deps, composition, accessibility.
- Security & performance: validate/sanitize inputs, avoid injection, measure
costs; DB/N+1 checks.
- Tests & docs: adequate coverage, edge cases, accurate docs and README updates.

Debug Protocol

- Phase 1: Reproduce with exact steps, env/config, frequency; gather logs,
traces, recent changes.
- Phase 2: Form hypotheses from symptoms; consider env dependencies; know
common bug patterns.
- Phase 3: Investigate with strategic logging, binary search isolation, `git bisect`.
- Phase 4: Minimal fix; document why; verify with tests; add regression test.
- Phase 5: Prevention via validation, assertions, clearer errors, and targeted tests.

Planning & Architecture

- Assess structure: project tree, hotspots (TODO/FIXME), dependency graphs,
outdated deps.
- Document architecture with clear boundaries (presentation, app/domain, infra)
and contracts.
- Plan migrations safely (parallel, gradual rollout, cleanup, rollback steps).
- Record decisions with ADRs (context, decision, consequences, alternatives).

Documentation Standards

- Rust: `///` docs with arguments/returns/examples/panics; ensure doctests compile.
- Python: comprehensive docstrings (Args/Returns/Raises/Examples/Notes).
- React/TS: component/prop docs with examples; surface usage and a11y notes.
- Project docs: crisp README (quick start, features, docs links, arch, tests,
performance, contributing, license).

Quality Gates (before calling anything “done”)

- Compiles/lints/formatters clean; tests pass; docs updated; error handling
robust; performance acceptable; security checks addressed; follows conventions.

Common Output Templates

- Security audit report: metadata, categorized issues (P0–P3),
dependency vulns, prioritized actions, score.
- Bug report: issue summary, location, root cause, solution, verification, prevention.
- Refactor plan: current state metrics, sequence, before/after excerpts,
verification, metrics delta.
- Test suite plan: coverage targets, generated tests by category, edge cases,
remaining gaps.
