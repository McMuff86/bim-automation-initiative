# ADR-0001 – Initial Choices

- **IFC as primary format** for openness (OpenBIM).
- **WebGL viewer** (xeokit or ifc.js) client-side for fast MVP iteration.
- **Bounding-box clash as starting point** (simple, quickly demonstrable), precise geometry later.
- **Repository structure** with `src/webviewer` + optional `src/server`.
- **CI**: separate pipelines for Web & Python.
- **Python toolchain**: prefer `uv` for dependency management, execution, and reproducible environments.
- **Developer tooling**: consider **MCP (Model Context Protocol)** for IDE-integrated automations and repository operations.

## Consequences
- Faster local setup and reproducible Python envs via `uv sync`.
- Client-side rendering keeps MVP simple; server remains optional.
- MCP can automate repetitive repo tasks (scaffolding, CI updates) without bloating runtime deps.

## How to adopt
- Use `uv sync` and `uv run` for Python tasks in `src/server`.
- Keep webviewer client-side; defer server features to when needed.
- Configure MCP providers in IDE when available; keep scripts under `tools/` for parity.

*Date: 2025-08-27*
