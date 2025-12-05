# DATA_SOURCES.md - Inventario de Fuentes de Datos

## La Zarza (Badajoz) - Datos de Referencia

| Campo | Valor |
|-------|-------|
| **Código Postal** | 06830 |
| **Código INE** | 06162 |
| **Provincia** | Badajoz (06) |
| **Código Municipal** | 162 |
| **Comunidad Autónoma** | Extremadura |

---

## 1. POBLACIÓN Y DEMOGRAFÍA

### Estado de Verificación: ✅ VERIFICADO

| Dato | Valor | Fuente | Estado |
|------|-------|--------|--------|
| Población 2024 | 3.345 hab. | INE Censo Anual | ✅ Verificado |
| Hombres | 1.686 | INE | ✅ Verificado |
| Mujeres | 1.659 | INE | ✅ Verificado |
| Edad media | 44.77 años | INE | ✅ Verificado |
| Superficie | 63 km² | INE | ✅ Verificado |
| Densidad | 53.1 hab/km² | Calculado | ✅ Verificado |
| Menores 18 años | 536 (16%) | INE | ✅ Verificado |
| 18-65 años | 2.140 (63.9%) | INE | ✅ Verificado |
| Mayores 65 años | 674 (20.1%) | INE | ✅ Verificado |

### Serie Histórica 2015-2024 (✅ VERIFICADA)

| Año | Población | Variación |
|-----|-----------|-----------|
| 2015 | 3.586 | - |
| 2016 | 3.542 | -44 |
| 2017 | 3.485 | -57 |
| 2018 | 3.508 | +23 |
| 2019 | 3.472 | -36 |
| 2020 | 3.402 | -70 |
| 2021 | 3.380 | -22 |
| 2022 | 3.386 | +6 |
| 2023 | 3.369 | -17 |
| 2024 | 3.345 | -24 |

### API/Fuente Principal
```
Fuente: Instituto Nacional de Estadística (INE)
URL Web: https://www.ine.es/jaxiT3/Tabla.htm?t=2859
Tabla: 2859 (Población por municipios y sexo)
Código territorio: 06162
Frecuencia: Anual (enero)
Licencia: CC BY 4.0
```

### Fuente Secundaria de Verificación
```
URL: https://www.foro-ciudad.com/badajoz/la-zarza/habitantes.html
Tipo: Web scraping (datos INE procesados)
Uso: Verificación cruzada
```

---

## 2. INFRAESTRUCTURA MUNICIPAL

### Estado de Verificación: ✅ VERIFICADO (API CKAN Diputación)

### API Principal
```
Base URL: https://datosabiertos.dip-badajoz.es/api/3/action/
Tipo: CKAN API v3
Licencia: CC-BY
Filtro: codigo_provincia=6, codigo_municipio=162
```

### Datasets Verificados con Datos de La Zarza

| Dataset | Registros | URL CSV 2025 |
|---------|-----------|--------------|
| casas-consistoriales | 8 | [CSV](https://datosabiertos.dip-badajoz.es/.../casasconsistoriales2025.csv) |
| cementerios | 1 | [CSV](https://datosabiertos.dip-badajoz.es/.../cementerios2025.csv) |
| centros-sanitarios | 1 | [CSV](https://datosabiertos.dip-badajoz.es/.../centrossanitarios2025.csv) |
| centros-ensenanza | 3 | [CSV](https://datosabiertos.dip-badajoz.es/.../centrosensenanza2025.csv) |
| centros-culturales | 6 | [CSV](https://datosabiertos.dip-badajoz.es/.../centrosculturales2025.csv) |
| centros-asistenciales | 1 | [CSV](https://datosabiertos.dip-badajoz.es/.../centrosasistenciales2025.csv) |
| instalaciones-deportivas | 5 | [CSV](https://datosabiertos.dip-badajoz.es/.../instalacionesdeportivas2025.csv) |
| parques | 9 | [CSV](https://datosabiertos.dip-badajoz.es/.../parques2025.csv) |
| depositos | 5 | [CSV](https://datosabiertos.dip-badajoz.es/.../depositos2025.csv) |
| potabilizacion | 1 | [CSV](https://datosabiertos.dip-badajoz.es/.../potabilizacion2025.csv) |

### Ejemplo de Consulta API
```bash
# Listar todos los datasets
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_list"

# Obtener info de un dataset
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_show?id=centros-sanitarios"

# Filtrar CSV por La Zarza
curl "[URL_CSV]" | grep "^6,162"
```

---

## 3. PRESUPUESTOS MUNICIPALES

### Estado de Verificación: ⚠️ PENDIENTE DE FUENTE REAL

| Dato | Valor Actual | Fuente | Estado |
|------|--------------|--------|--------|
| Presupuesto 2024 | 3.200.000 € | Sin verificar | ⚠️ Pendiente |
| Gastos Personal | 1.680.000 € | Sin verificar | ⚠️ Pendiente |
| Bienes Corrientes | 720.000 € | Sin verificar | ⚠️ Pendiente |

### Fuentes Potenciales a Investigar
1. **Portal de Transparencia Ayto. La Zarza**: https://www.lazarza.es (si existe)
2. **Rendición de Cuentas**: https://www.rendiciondecuentas.es
3. **Ministerio de Hacienda**: Datos de liquidación presupuestaria
4. **Diputación de Badajoz**: Posible dataset de presupuestos

### Acción Requerida
```
🔴 CRÍTICO: Los datos de presupuesto NO están verificados.
Mostrar como "Datos pendientes de verificación" o eliminar hasta
obtener fuente oficial.
```

---

## 4. SUBVENCIONES Y AYUDAS

### Estado de Verificación: ⚠️ DATOS ILUSTRATIVOS

| Dato | Estado |
|------|--------|
| Lista de 12 subvenciones | ⚠️ Datos ilustrativos, no verificados |
| Importes | ⚠️ Estimaciones, no reales |

### Fuentes Potenciales
1. **Base de Datos Nacional de Subvenciones (BDNS)**
   - URL: https://www.pap.hacienda.gob.es/bdnstrans/
   - API: Disponible con registro

2. **Datos.gob.es**
   - Búsqueda: "subvenciones Extremadura"
   - API CKAN disponible

### Consulta BDNS Recomendada
```
Beneficiario: "Ayuntamiento de La Zarza" OR "La Zarza"
Provincia: Badajoz
Años: 2020-2024
```

---

## 5. PATRIMONIO CULTURAL

### Estado de Verificación: ⚠️ PENDIENTE

| Dato | Valor Actual | Estado |
|------|--------------|--------|
| Bienes catalogados | 7 | ⚠️ Sin verificar |
| Iglesia San Miguel | BIC | ⚠️ Verificar en Junta Extremadura |

### Fuentes Potenciales
1. **Junta de Extremadura - Patrimonio**
   - URL: https://www.juntaex.es/cultura/patrimonio
   - Catálogo de BIC

2. **Ministerio de Cultura**
   - Bienes de Interés Cultural
   - Base de datos del Patrimonio

---

## 6. TURISMO

### Estado de Verificación: ⚠️ PARCIAL

### Fuentes Verificables
1. **OpenStreetMap / Overpass API** (alojamientos, POIs)
2. **Booking.com / Google Maps** (solo conteo, no scraping)
3. **Registro de Turismo de Extremadura** (oficial)

---

## RESUMEN DE ESTADO DE DATOS

| Sección | Estado | Prioridad |
|---------|--------|-----------|
| Población | ✅ VERIFICADO | - |
| Infraestructura | ✅ VERIFICADO | - |
| Presupuestos | 🔴 SIN VERIFICAR | ALTA |
| Subvenciones | ⚠️ ILUSTRATIVO | ALTA |
| Patrimonio | ⚠️ PENDIENTE | MEDIA |
| Turismo | ⚠️ PARCIAL | BAJA |

---

## APIs PRIORIZADAS (Fáciles de Implementar)

### Prioridad 1: Ya Funcionando
1. **INE** - Población (tabla 2859)
2. **Diputación Badajoz CKAN** - Infraestructura

### Prioridad 2: Implementar
1. **BDNS** - Subvenciones reales
2. **Rendición de Cuentas** - Presupuestos

### Prioridad 3: Investigar
1. **Junta Extremadura Open Data** - Patrimonio
2. **Overpass API** - Turismo/POIs

---

## Código de Colores para el Dashboard

```
✅ Verde: Dato verificado con fuente oficial
⚠️ Amarillo: Dato pendiente de verificación
🔴 Rojo: Dato NO disponible - no mostrar
📊 Azul: Dato calculado a partir de fuentes verificadas
```

---

## TAREAS PENDIENTES (TODO)

### Prioridad ALTA
- [ ] **Presupuestos**: Buscar en https://www.rendiciondecuentas.es datos de La Zarza
- [ ] **Subvenciones**: Consultar BDNS (https://www.pap.hacienda.gob.es/bdnstrans/) con filtro "La Zarza" o "Ayuntamiento de La Zarza"
- [ ] **Dashboard**: Marcar visualmente los datos no verificados con indicador ⚠️
- [ ] **Código**: Eliminar o comentar datos inventados en `scripts/main.js`

### Prioridad MEDIA
- [ ] **Patrimonio**: Verificar bienes culturales en portal Junta de Extremadura
- [ ] **Infraestructura**: Integrar datos reales de la API Diputación en el dashboard
- [ ] **Servicios**: Mostrar datos reales de centros (sanitarios, educativos, culturales)

### Prioridad BAJA
- [ ] **Turismo**: Consultar Overpass API para POIs de La Zarza
- [ ] **Comparativas**: Añadir datos de municipios similares (verificados)

---

## COMANDOS ÚTILES

### Consultar API Diputación
```bash
# Listar datasets
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_list"

# Ver dataset específico
curl "https://datosabiertos.dip-badajoz.es/api/3/action/package_show?id=centros-sanitarios"

# Descargar y filtrar por La Zarza (código 6,162)
curl "[URL_CSV]" | grep "^6,162"
```

### Verificar población INE
```bash
# Web oficial
https://www.ine.es/jaxiT3/Tabla.htm?t=2859

# Verificación secundaria
https://www.foro-ciudad.com/badajoz/la-zarza/habitantes.html
```

---

*Última actualización: 2025-12-05*
*Código INE: 06162 | CP: 06830*
