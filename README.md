# BIM Automation Initiative

**Goal:** Web-based BIM clash-detection MVP (IFC upload → 3D viewer → bounding-box clash).

## Quick Links
- [Agents](Agents.md)
- [Project Plan](bim_automation_project_plan.md)
- [Repository Structure](REPO_STRUCTURE.md)
- [ADR-0001 – Initial Choices](docs/ADR/ADR-0001-initial-choices.md)

## Getting Started

### Webviewer (Client)
- Requirements: Node 18+, pnpm
- Commands:
  ```bash
  cd src/webviewer
  pnpm i
  pnpm dev
  ```

### (Optional) Server
- Requirements: Python 3.11+, uv or pip
- Commands:
  ```bash
  cd src/server
  uv sync && uv run pytest   # or: pip install -r requirements.txt && pytest
  ```

### Tooling
- **uv**: preferred Python toolchain for dependency management and execution.
- **MCP (Model Context Protocol)**: optional IDE-integrated tools for automation and repository operations.

## Folders
See [REPO_STRUCTURE.md](REPO_STRUCTURE.md).

## CI
- Web: build/lint/test via GitHub Actions (`.github/workflows/ci-web.yml`)
- Python: tests/lint (`.github/workflows/ci-python.yml`)

## License
MIT – see [LICENSE](LICENSE).
