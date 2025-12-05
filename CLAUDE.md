# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Dashboard Municipal de La Zarza - A citizen transparency tool (non-official) that centralizes verifiable public data about the municipality of La Zarza (06830, Badajoz, Extremadura, Spain). Built as a static single-page application.

## URLs

- **Production:** https://lazarza.axcsol.com
- **Repository:** https://github.com/xuli70/lazarza

## Development Commands

```bash
# Local development - open index.html directly in browser
# No build process required - static files only

# Deploy to production (Coolify auto-deploys on push to main)
git push origin main

# Optional: Minify for production
terser scripts/main.js -o scripts/main.min.js
cleancss styles/main.css -o styles/main.min.css
```

## Architecture

### File Structure
```
├── index.html              # Single-page application (all sections)
├── styles/
│   ├── main.css           # Base styles, CSS custom properties, components
│   └── traceability.css   # Modal styles for data source verification
├── scripts/
│   └── main.js            # All JavaScript logic
├── Dockerfile              # nginx:alpine container for production
├── nginx.conf              # nginx config with gzip, caching, security headers
```

### Key Design Principles

1. **No Data Invention** - If data isn't available from a verifiable public API, display "No data available" instead of estimating or inventing values.

2. **Traceability First** - Every displayed data point must have complete traceability metadata:
   - API endpoint URL and parameters
   - Timestamp of extraction
   - SHA256 hash validation
   - Clickable verification links
   - QR codes for mobile verification

3. **Progressive Enhancement** - Base functionality works without JavaScript; JS adds interactivity.

### Navigation System
SPA-style navigation using `data-section` attributes. Sections are shown/hidden by adding/removing the `active` class. Each nav link maps to a section ID in the HTML.

### Data Sources
- **INE (Instituto Nacional de Estadística)** - Population demographics
- **Diputación de Badajoz (CKAN API)** - Municipal budgets, services
- **Datos.gob.es** - Subsidies and public grants
- **Junta de Extremadura** - Cultural heritage inventory
- **OpenStreetMap/Overpass** - Points of interest, lodging

### Traceability System
The `traceabilityData` object in `main.js` contains metadata for each data source. Clicking the ℹ️ button opens a modal with full verification details. Structure:
```javascript
traceabilityData = {
  'source-id': {
    title, source, url, apiEndpoint, method, queryParams,
    lastUpdate, frequency, responsibleOrg, license,
    recordsCount, validationStatus, dataHash, coverage,
    notes, verificationLink
  }
}
```

### Visualization Libraries
- **Chart.js** - Line charts, donut charts, bar charts for population/budget data
- **Leaflet + OpenStreetMap** - Interactive maps for heritage and tourism points
- **QRCode.js** - QR codes for verification links in modals

### CSS Architecture
Uses CSS custom properties (variables) defined in `:root`. Key tokens:
- Colors: `--primary-500`, `--success-500`, `--warning-500`, `--error-500`
- Spacing: `--space-8` through `--space-64`
- Typography: `--text-h1` through `--text-small`

Mobile-first responsive design with breakpoints at 480px, 768px, 1024px, 1440px.

## Deployment

Hosted on Coolify (Hostinger VPS) with automatic deployment on push to `main` branch.

```bash
# Manual deploy trigger via Coolify API
# Application UUID: fkc0c480k44o4owg484wwsg8
# Project: zarza (vgoc0gkcskgs4c048go84w8w)
```

Docker build uses nginx:alpine (~40MB image) serving static files on port 80.

## Language

All content is in Spanish. Dashboard targets citizens of La Zarza municipality.
