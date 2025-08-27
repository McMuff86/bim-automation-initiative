# Integration

## Today (MVP)
- IFC upload (client-side)
- Export clash list as JSON/CSV

## Later (Roadmap)
- ERP (BORM) integration via CSV/REST
- Auth/share (OIDC), project workspaces
- 4D/5D (time/cost) & digital twin hooks

## MCP (Model Context Protocol)
- Purpose: automate repository tasks from IDE (e.g., scaffolding webviewer, updating CI files).
- Scope: development-time only; no runtime dependency for the MVP.
- Examples:
  - Generate baseline `ci-web.yml` and `ci-python.yml`
  - Create sample data stubs under `data/samples/`
