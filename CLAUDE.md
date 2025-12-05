# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Dashboard Municipal de La Zarza - A citizen transparency tool (non-official) that centralizes verifiable public data about the municipality of La Zarza (06830, Badajoz, Extremadura, Spain). Built as a static single-page application.

## Datos de Referencia del Municipio

| Campo | Valor |
|-------|-------|
| **Municipio** | La Zarza |
| **Código Postal** | 06830 |
| **Código INE** | 06162 |
| **Provincia** | Badajoz (código 06) |
| **Código Municipal** | 162 |
| **Población 2024** | 3.345 habitantes |

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
├── DATA_SOURCES.md         # Inventario de fuentes de datos y su estado
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

---

## Fuentes de Datos Verificadas

### ✅ POBLACIÓN (VERIFICADO)
```
Fuente: Instituto Nacional de Estadística (INE)
Tabla: 2859 (Población por municipios y sexo)
Código territorio: 06162
URL: https://www.ine.es/jaxiT3/Tabla.htm?t=2859
Frecuencia: Anual (enero)
Licencia: CC BY 4.0

Verificación secundaria:
https://www.foro-ciudad.com/badajoz/la-zarza/habitantes.html
```

### ✅ INFRAESTRUCTURA MUNICIPAL (VERIFICADO)
```
Fuente: Diputación de Badajoz - Portal de Datos Abiertos
API: CKAN v3
Base URL: https://datosabiertos.dip-badajoz.es/api/3/action/
Filtro: codigo_provincia=6, codigo_municipio=162
Licencia: CC-BY

Datasets disponibles con datos de La Zarza:
- casas-consistoriales: 8 registros
- cementerios: 1 registro
- centros-sanitarios: 1 registro
- centros-ensenanza: 3 registros
- centros-culturales: 6 registros
- centros-asistenciales: 1 registro
- instalaciones-deportivas: 5 registros
- parques: 9 registros
- depositos: 5 registros
- potabilizacion: 1 registro
```

### ⚠️ PRESUPUESTOS (PENDIENTE VERIFICACIÓN)
```
Estado: Los datos actuales NO están verificados
Acción: Buscar fuente en:
  - Portal de Transparencia del Ayuntamiento
  - https://www.rendiciondecuentas.es
  - Ministerio de Hacienda
```

### ⚠️ SUBVENCIONES (DATOS ILUSTRATIVOS)
```
Estado: Los datos actuales son ilustrativos, NO reales
Fuente potencial: Base de Datos Nacional de Subvenciones (BDNS)
URL: https://www.pap.hacienda.gob.es/bdnstrans/
```

---

## Consultas API Rápidas

### Población INE
```bash
# Web de consulta
https://www.ine.es/jaxiT3/Tabla.htm?t=2859&L=0

# Verificar en Foro-Ciudad
https://www.foro-ciudad.com/badajoz/la-zarza/habitantes.html
```

### Infraestructura Diputación
```bash
# Listar todos los datasets
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_list"

# Obtener info de un dataset específico
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_show?id=centros-sanitarios"

# Descargar CSV y filtrar por La Zarza
curl "[URL_CSV]" | grep "^6,162"
```

---

## Estado de Verificación de Datos

| Sección | Estado | Notas |
|---------|--------|-------|
| Población | ✅ VERIFICADO | INE Código 06162 |
| Serie histórica | ✅ VERIFICADO | 2015-2024 |
| Infraestructura | ✅ VERIFICADO | API CKAN Diputación |
| Presupuestos | 🔴 SIN VERIFICAR | Eliminar o marcar |
| Subvenciones | ⚠️ ILUSTRATIVO | Buscar BDNS |
| Patrimonio | ⚠️ PENDIENTE | Verificar Junta Extremadura |

---

## Navigation System
SPA-style navigation using `data-section` attributes. Sections are shown/hidden by adding/removing the `active` class. Each nav link maps to a section ID in the HTML.

## Traceability System
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

## Visualization Libraries
- **Chart.js** - Line charts, donut charts, bar charts for budget/financial data
- **Pure CSS Charts** - Population evolution chart (HTML/CSS only, no canvas flickering)
- **Leaflet + OpenStreetMap** - Interactive maps for heritage and tourism points
- **QRCode.js** - QR codes for verification links in modals

## Population Chart (CSS-only)
The main population evolution chart on the home page uses pure HTML/CSS bars instead of Chart.js canvas to prevent flickering during scroll. Each bar uses CSS custom properties (`--bar-height`) for dynamic heights, with `data-year` and `data-value` attributes for labels.

## CSS Architecture
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
