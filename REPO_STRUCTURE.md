# Repository Structure Proposal – BIM Automation Initiative

> Goal: Clear, scalable structure for code, data, docs, and automations.  
> All central documents are inter-linked (Agents, Project Plan, ADRs).

```
bim-automation-initiative/
├─ README.md
├─ Agents.md
├─ bim_automation_project_plan.md
├─ docs/
│  ├─ Architecture.md
│  ├─ Integration.md
│  ├─ UI_UX.md
│  ├─ Roadmap.md
│  └─ ADR/
│     └─ ADR-0001-initial-choices.md
├─ src/
│  ├─ webviewer/              # Web app (IFC viewer + clash detection)
│  │  ├─ package.json
│  │  ├─ vite.config.ts
│  │  └─ src/
│  │     ├─ index.html
│  │     ├─ main.ts
│  │     ├─ components/
│  │     ├─ services/
│  │     └─ styles/
│  └─ server/                 # (optional) backend for upload/processing
│     ├─ pyproject.toml
│     └─ app/
│        ├─ __init__.py
│        ├─ api.py
│        ├─ clash_detection.py
│        ├─ ifc_utils.py
│        └─ tests/
├─ data/
│  ├─ samples/
│  │  └─ sample_with_clash.ifc
│  └─ README.md
├─ schemas/
│  ├─ bim_analysis.schema.json
│  └─ README.md
├─ tools/
│  ├─ scripts/
│  │  ├─ convert_ifc.py
│  │  └─ validate_schema.py
│  └─ notebooks/
│     └─ exploration.ipynb
├─ .github/
│  ├─ workflows/
│  │  ├─ ci-web.yml           # Node build, lint, test
│  │  ├─ ci-python.yml        # Py tests, lint
│  │  └─ release-drafter.yml
│  ├─ ISSUE_TEMPLATE/
│  │  ├─ bug_report.md
│  │  └─ feature_request.md
│  ├─ PULL_REQUEST_TEMPLATE.md
│  └─ CODEOWNERS
├─ .editorconfig
├─ .gitignore
└─ LICENSE
```

## Key Links
- **[Agents.md](Agents.md)** – roles, responsibilities, watchouts
- **[bim_automation_project_plan.md](bim_automation_project_plan.md)** – overall plan/phases
- **docs/**
  - **Architecture.md** – target architecture, components, data flows
  - **Integration.md** – ERP/IFC/Viewer integrations
  - **UI_UX.md** – navigation, interactions, mockups
  - **ADR/** – Architecture Decision Records (MADR-style)

## CI/CD (Recommendation)
- **Node/Web:** `pnpm i && pnpm build && pnpm test`
- **Python:** `uv run pytest` (preferred) or `pytest`, `ruff` for linting
- **Release Drafter:** auto-changelog via labels/conventional commits
- **Pre-commit hooks:** `ruff`, `black`, `markdownlint`, `prettier`
- **MCP tools:** optional IDE-integrated automations for repetitive repo tasks

## Conventions
- **Branching:** `main` (stable), `feat/*`, `fix/*`
- **Commits:** Conventional Commits (`feat:`, `fix:`, `docs:` …)
- **Versioning:** SemVer (0.x in early phases)
- **Issues/PRs:** templates required; screenshots/GIFs encouraged

## Definitions (short)
- **Webviewer:** client-side IFC rendering + BB‑clash check (MVP)
- **Server:** optional for larger models/pre-processing
- **Schemas:** JSON schemas for analysis/export (ERP bridge)
- **Tools:** utility scripts, notebooks for exploration

## Next Steps
1. Create the repo and initialize this structure.
2. Populate `README.md` with links to **Agents**, **Project Plan**, and **Demo Start**.
3. Scaffold `src/webviewer` as a Vite/React app with upload + viewer basics.
4. Draft `schemas/bim_analysis.schema.json` (doors/openings/services, bounding box).
5. Enable CI workflows (Node + Python).

---

## Cursor vs. ChatGPT Web vs. OpenAI API – Recommendation

### Cursor (IDE with chat)
- **Strengths:** tight code integration, inline refactors, agent runs inside repo, PR helpers.
- **Use:** **Daily for coding.** Ideal for `src/` work, tests, quick iterations.
- **Setup tip:** open the project as a workspace; contextualize chat to repo; add MCP tools later for automations.

### ChatGPT Web
- **Strengths:** strategic planning, quick prototypes, document authoring.
- **Use:** **Project steering & docs.** Agents.md, sprint planning, architecture sketches.

### OpenAI API
- **Strengths:** **Product feature** (e.g., auto clash notes, natural queries “show clashes on level 2”), server automations, embeddings for search.
- **Use:** **From Sprint 2+** integrate in `src/server` (optional value; not required for MVP).

**Bottom line:**  
- **Now:** GitHub + Cursor for coding; ChatGPT Web for planning/docs.  
- **Later:** integrate OpenAI API into the product (if clear value).

---

## Minimal README skeleton (starter)

```md
# BIM Automation Initiative

**Goal:** Web-based BIM clash-detection MVP (IFC upload → 3D viewer → BB‑clash).

## Quick Links
- [Agents](Agents.md)
- [Project Plan](bim_automation_project_plan.md)

## Dev Setup
- Web: `pnpm i && pnpm dev`
- Python (optional server): `uv sync && uv run pytest`

## Folders
See [Repository Structure](REPO_STRUCTURE.md).

## License
MIT (TBD)
```
