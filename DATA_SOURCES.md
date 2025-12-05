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

### Datasets Verificados con Datos de La Zarza (Consultados 2025-12-05)

| Dataset | Registros | Detalle |
|---------|-----------|---------|
| centros-sanitarios | 1 | Centro de Salud (940m²) |
| centros-ensenanza | 3 | Escuela Infantil, CEIP Ntra Sra de las Nieves, IES Tierrablanca |
| centros-culturales | 6 | Casa de la Cultura, Auditorio Municipal, Centro El Albergue, Hogar de Mayores, Centro Joven, Centro Ocio Juvenil |
| instalaciones-deportivas | 5 | Ciudad Deportiva, Piscina Municipal, Pistas Polideportivas, Palacio de Deportes, Pabellon Polideportivo |
| parques | 9 | Parque Monte Calvario, Parque Sr. Jose, Parque San Marcos, Parque Valdelirios, Parque de las Nieves, etc. |

### URLs CSV Verificadas (2025)
```
centros-sanitarios: https://datosabiertos.dip-badajoz.es/.../centrossanitarios2025.csv
centros-ensenanza: https://datosabiertos.dip-badajoz.es/.../centrosensenanza2025.csv
centros-culturales: https://datosabiertos.dip-badajoz.es/.../centrosculturales2025.csv
instalaciones-deportivas: https://datosabiertos.dip-badajoz.es/.../instalacionesdeportivas2024.csv (2025 no disponible aun)
parques: https://datosabiertos.dip-badajoz.es/.../parques2024.csv
```

### Filtro para La Zarza
Los datos se filtran por `codigo_provincia=6, codigo_municipio=162` (primeras dos columnas del CSV)

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

### Estado de Verificación: ✅ PARCIALMENTE VERIFICADO

| Bien | Categoría | Declaración | Fuente |
|------|-----------|-------------|--------|
| Iglesia de San Martín de Tours | Monumento (BIC) | Decreto 223/2014, 30/09/2014 | [BOE-A-2014-13611](https://www.boe.es/diario_boe/txt.php?id=BOE-A-2014-13611) |
| Abrigo de La Calderita | Zona Arqueológica (BIC) | Resolución 26/06/2009 | [BOE-A-2010-18835](https://www.boe.es/diario_boe/txt.php?id=BOE-A-2010-18835) |
| Ermita Ntra. Sra. de las Nieves | Monumento religioso | Pendiente | Pendiente verificación |
| El Pilar, Monumento al Arriero, Estatua del Emigrante | Otros | Pendiente | Pendiente verificación |

### Notas sobre la Iglesia de San Martín
- Siglo XVI, ubicada en zona elevada del pueblo
- Expediente BIC incoado: 13/05/1991 (DOE nº39, BOE nº187)
- Restauraciones: cubierta y reconstrucción completa del campanario
- Diócesis: Mérida-Badajoz

### Notas sobre el Abrigo de La Calderita
- También conocido como "Gran Abrigo de Las Viñas"
- Ubicación: Sierra de Peñas Blancas, 2km al SO de La Zarza
- Parcela 474, Polígono 7
- Arte rupestre protegido por Ley 2/1999 de Patrimonio de Extremadura

### Fuentes Verificadas
1. **BOE - Declaraciones BIC**
   - Iglesia: https://www.boe.es/diario_boe/txt.php?id=BOE-A-2014-13611
   - Abrigo: https://www.boe.es/diario_boe/txt.php?id=BOE-A-2010-18835

2. **Junta de Extremadura - Patrimonio**
   - URL: https://www.juntaex.es/cultura/patrimonio
   - Catálogo de BIC

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
- [x] **Presupuestos**: Investigado - Publicado en BOP n.77 (23/04/2024). Datos en CONPREL requieren consulta manual
- [x] **Subvenciones**: Investigado - BDNS requiere consulta por CIF P0616200B (portal JavaScript)
- [x] **Dashboard**: Marcados datos no verificados con indicadores visuales (CSS + HTML)
- [x] **Código**: Comentados datos ilustrativos en `scripts/main.js` con avisos claros

### Prioridad MEDIA
- [x] **Patrimonio**: Verificado - 2 BIC oficiales (Iglesia San Martin + Abrigo Calderita)
- [x] **Infraestructura**: Verificada API Diputacion - datos reales obtenidos
- [x] **Servicios**: Actualizados datos reales de centros en el dashboard (sanitarios, educativos, culturales, deportivos)

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

*Ultima actualizacion: 2025-12-05*
*Codigo INE: 06162 | CP: 06830*

---

## CHANGELOG SESION 2025-12-05

### Completado
1. **Presupuestos**: Investigado en Rendicion de Cuentas y CONPREL. Presupuesto 2024 publicado en BOP n.77 (23/04/2024). No hay API publica accesible.
2. **Subvenciones**: Investigado BDNS. Portal requiere JavaScript. CIF Ayto: P0616200B
3. **Indicadores visuales**: Anadidos badges "Sin verificar" a KPIs de presupuesto y subvenciones. Avisos en secciones.
4. **Codigo JS**: Comentados datos ilustrativos con avisos claros de fuentes pendientes.
5. **Patrimonio**: Verificados 2 BIC oficiales:
   - Iglesia de San Martin de Tours (BOE-A-2014-13611)
   - Abrigo de La Calderita (BOE-A-2010-18835)
6. **API Diputacion**: Verificada y consultada. Datos reales obtenidos para La Zarza.
7. **Centros municipales**: Actualizados con datos reales de la API:
   - 1 centro sanitario (940 m²)
   - 3 centros educativos (CEIP Ntra Sra Nieves, IES Tierrablanca, Escuela Infantil)
   - 6 centros culturales
   - 5 instalaciones deportivas
   - 9 parques

### Pendiente (Prioridad Baja)
- Turismo: Consultar Overpass API
- Comparativas: Datos de municipios similares
