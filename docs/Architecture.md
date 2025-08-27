# Architecture

## Target Architecture (MVP)
- **Client (webviewer):** IFC viewer + simple bounding-box clash check
- **Server (optional):** pre-processing, large models, API gateway
- **Storage:** S3/blob (uploads), optional DB (logs, findings)

## Components
- Loader → SceneGraph → BVH/BB index → ClashEngine → UI (list/highlight)

## Data Flows
IFC upload → parse → scene → BB index → clash check → UI highlight/export
