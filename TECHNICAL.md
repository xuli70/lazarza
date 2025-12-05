# 📋 Documentación Técnica - Dashboard Municipal La Zarza

## 🏗️ Arquitectura del Sistema

### 📁 Estructura del Proyecto
```
dashboard-la-zarza/
├── index.html              # Estructura HTML principal
├── styles/
│   ├── main.css           # Estilos base y componentes
│   └── traceability.css   # Estilos específicos de trazabilidad
├── scripts/
│   └── main.js           # Lógica JavaScript principal
├── README.md             # Documentación de usuario
└── TECHNICAL.md          # Este archivo
```

### 🎯 Filosofía de Diseño

#### 1. No Invención de Datos
```javascript
// Si no hay datos en la fuente, mostrar mensaje explícito
if (!dataAvailable) {
  displayMessage("No hay datos disponibles en fuentes oficiales");
} else {
  displayData(data);
  attachTraceability(data);
}
```

#### 2. Trazabilidad Primero
Cada dato debe poder ser verificado manualmente en su fuente original:
- URL exacta de la API consultada
- Parámetros específicos utilizados
- Timestamp de la extracción
- Hash de validación
- Enlaces clickeables de verificación

#### 3. Progresive Enhancement
- Base funcional sin JavaScript
- Mejoras progresivas con JS
- Fallbacks para funcionalidades avanzadas

## 🔧 Especificaciones Técnicas

### 🌐 Compatibilidad de Navegadores
- **Chrome**: 90+ ✅
- **Firefox**: 88+ ✅  
- **Safari**: 14+ ✅
- **Edge**: 90+ ✅
- **Mobile Safari**: 14+ ✅
- **Chrome Mobile**: 90+ ✅

### 📱 Responsive Breakpoints
```css
/* Mobile First Approach */
:root {
  --mobile: 480px;
  --tablet: 768px;
  --desktop: 1024px;
  --large: 1440px;
}

/* Implementación */
@media (max-width: 768px) { /* Tablet y móvil */ }
@media (max-width: 480px) { /* Móvil pequeño */ }
@media (min-width: 1024px) { /* Desktop */ }
```

### 🎨 Sistema de Colores (CSS Custom Properties)
```css
:root {
  /* Colores Primarios */
  --primary-500: #0066CC;     /* Azul corporativo */
  --primary-100: #E6F0FF;     /* Azul claro para backgrounds */
  --primary-700: #004C99;     /* Azul oscuro para hover states */
  
  /* Colores Semánticos */
  --success-500: #00AA00;     /* Verde para verificación */
  --warning-500: #FFAA00;     /* Amarillo para advertencias */
  --error-500: #CC0000;       /* Rojo para errores */
  --offline-500: #B91C1C;     /* Rojo oscuro para offline */
  
  /* Neutrales */
  --neutral-900: #18181B;     /* Texto principal */
  --neutral-600: #52525B;     /* Texto secundario */
  --neutral-200: #E4E4E7;     /* Bordes */
  --neutral-100: #FFFFFF;     /* Superficies */
  --neutral-50: #F8F9FA;      /* Fondo de página */
}
```

### 📊 Variables JavaScript Principales

#### Datos de Trazabilidad
```javascript
const traceabilityData = {
  'sourceId': {
    title: 'Título del Dataset',
    source: 'Nombre oficial de la fuente',
    url: 'https://example.com/portal',
    apiEndpoint: 'https://api.example.com/data',
    method: 'GET', // GET, POST, etc.
    queryParams: {
      // Parámetros exactos usados en la consulta
    },
    lastUpdate: '2025-12-05T01:25:00Z',
    frequency: 'Anual (primavera)',
    responsibleOrg: 'Nombre del organismo',
    license: 'CC-BY (Atribución)',
    recordsCount: 123,
    validationStatus: 'passed', // passed, warning, failed
    dataHash: 'sha256:abc123...',
    coverage: '2020-2024',
    notes: 'Descripción técnica del dataset',
    verificationLink: 'https://source.example.com/dataset'
  }
};
```

#### Datos de Visualización
```javascript
// Datos para gráficos Chart.js (Fuente: INE - Código municipio 06162)
const poblacionHistorica = {
  labels: ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024'],
  data: [3586, 3542, 3485, 3508, 3472, 3402, 3380, 3386, 3369, 3345]
};

// Coordenadas para mapas Leaflet
const zarzaCoords = [38.7336, -6.1789];
```

## 🛠️ Funcionalidades JavaScript

### 🧭 Sistema de Navegación
```javascript
function initializeNavigation() {
  const navLinks = document.querySelectorAll('.nav-link');
  const sections = document.querySelectorAll('.section');
  
  navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const sectionId = this.dataset.section;
      showSection(sectionId);
      updateActiveNav(this);
    });
  });
}

function showSection(sectionId) {
  sections.forEach(section => {
    section.classList.remove('active');
  });
  
  const targetSection = document.getElementById(sectionId);
  if (targetSection) {
    targetSection.classList.add('active');
    window.scrollTo({
      top: targetSection.offsetTop - 120,
      behavior: 'smooth'
    });
  }
}
```

### 🔍 Sistema de Trazabilidad
```javascript
function openTraceabilityModal(sourceId) {
  const data = traceabilityData[sourceId];
  if (!data) {
    console.error(`No se encontraron datos para: ${sourceId}`);
    return;
  }

  // Poblar contenido del modal
  modalTitle.textContent = data.title;
  modalBody.innerHTML = generateTraceabilityContent(data);
  
  // Mostrar modal
  modal.classList.add('active');
  document.body.style.overflow = 'hidden';

  // Generar QR code si está disponible
  if (typeof QRCode !== 'undefined') {
    generateQRCode(data.verificationLink);
  }
}
```

### 📊 Inicialización de Gráficos
```javascript
function initializeCharts() {
  // Gráficos de presupuesto (Chart.js)
  createPresupuestoCharts();

  // Pirámide poblacional (Chart.js)
  createPiramidePoblacional();

  // Nota: El gráfico de evolución poblacional usa CSS puro
  // para evitar problemas de renderizado con canvas
}
```

### 📈 Gráfico de Población (CSS Puro)
El gráfico de evolución poblacional en la página de inicio usa HTML/CSS puro
en lugar de Chart.js para evitar parpadeos durante el scroll:

```html
<div class="poblacion-chart-container">
  <div class="poblacion-bars">
    <div class="poblacion-bar" style="--bar-height: 100%;"
         data-year="2015" data-value="2.987"></div>
    <!-- ... más barras ... -->
  </div>
  <div class="poblacion-legend">
    <span class="legend-min">2.841</span>
    <span class="legend-trend">↘ Tendencia: -4.7% (10 años)</span>
    <span class="legend-max">2.987</span>
  </div>
</div>
```

```css
.poblacion-bar {
  flex: 1;
  height: var(--bar-height);
  background: linear-gradient(to top, var(--primary-500), var(--primary-400));
}

.poblacion-bar.highlight { /* Año de recuperación (2023) */
  background: linear-gradient(to top, var(--success-500), var(--success-400));
}

.poblacion-bar.current { /* Año actual (2024) */
  background: linear-gradient(to top, var(--warning-500), var(--warning-400));
}
```

### 🗺️ Sistema de Mapas
```javascript
function initializeMaps() {
  const zarzaCoords = [38.7336, -6.1789];
  
  // Mapa de patrimonio
  const patrimonioMap = L.map('patrimonioMap').setView(zarzaCoords, 14);
  
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
  }).addTo(patrimonioMap);

  // Marcadores con información
  patrimonioMarkers.forEach(marker => {
    L.marker(marker.coords).addTo(patrimonioMap)
      .bindPopup(`<strong>${marker.name}</strong><br>${marker.description}`);
  });
}
```

## 🔌 APIs y Integración de Datos

### 📡 Estructura de Datos Reales
```javascript
// Ejemplo de integración con INE
async function fetchPopulationData() {
  const response = await fetch(
    'https://servicios.ine.es/wstempus/js/es/' +
    'STATISTIC/2459.pcaxis/ES/1.0/01-01-2024.px'
  );
  
  const data = await response.json();
  
  return {
    population: data.value,
    year: 2024,
    municipality: '06162',  // Código INE correcto de La Zarza (Badajoz)
    timestamp: new Date().toISOString(),
    hash: await calculateHash(data)
  };
}
```

### 🛡️ Sistema de Validación
```javascript
function validateDataIntegrity(data, expectedHash) {
  const actualHash = calculateHash(data);
  
  if (actualHash !== expectedHash) {
    console.warn('Hash mismatch detected:', {
      expected: expectedHash,
      actual: actualHash
    });
    return false;
  }
  
  return true;
}

function calculateHash(data) {
  const jsonString = JSON.stringify(data);
  return 'sha256:' + crypto.subtle.digest('SHA-256', jsonString);
}
```

### 🔄 Sistema de Cache
```javascript
const cache = new Map();

function getCachedData(key) {
  const cached = cache.get(key);
  
  if (cached && Date.now() - cached.timestamp < 24 * 60 * 60 * 1000) {
    return cached.data;
  }
  
  return null;
}

function setCachedData(key, data) {
  cache.set(key, {
    data: data,
    timestamp: Date.now()
  });
}
```

## 📱 Responsive Design Implementation

### 🎯 Mobile First Approach
```css
/* Estilos base (móvil) */
.kpi-grid {
  grid-template-columns: 1fr;
  gap: var(--space-16);
}

.kpi-value {
  font-size: 28px;
}

/* Tablet */
@media (min-width: 768px) {
  .kpi-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: var(--space-24);
  }
  
  .kpi-value {
    font-size: 36px;
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .kpi-grid {
    grid-template-columns: repeat(4, 1fr);
  }
  
  .kpi-value {
    font-size: 48px;
  }
}
```

### 🔄 Navigation Collapse
```javascript
const navToggle = document.getElementById('navToggle');
const navMenu = document.getElementById('navMenu');

navToggle.addEventListener('click', function() {
  navMenu.classList.toggle('active');
});

// Cerrar menú al hacer clic fuera
document.addEventListener('click', function(e) {
  if (!navToggle.contains(e.target) && !navMenu.contains(e.target)) {
    navMenu.classList.remove('active');
  }
});
```

## 🎨 Sistema de Componentes

### 📊 KPI Card Component
```html
<div class="kpi-card" data-source="source-id">
  <div class="kpi-header">
    <h3 class="kpi-title">Título del KPI</h3>
    <button class="traceability-btn" data-source="source-id">
      <svg>...</svg>
    </button>
  </div>
  <div class="kpi-value">3.345</div>
  <div class="kpi-trend trend-down">↓ 0.7% vs 2023</div>
  <div class="kpi-source">Fuente oficial</div>
</div>
```

### 🏷️ Status Indicator Component
```html
<span class="status status-verified">✅ Verificado</span>
<span class="status status-partial">⚠️ Parcial</span>
<span class="status status-error">❌ Error</span>
<span class="status status-offline">🔴 Offline</span>
```

### 📋 Data Table Component
```html
<div class="table-card">
  <div class="table-header">
    <h3>Título de la tabla</h3>
    <button class="traceability-btn" data-source="source-id">
      <svg>...</svg>
    </button>
  </div>
  <table class="data-table">
    <thead>
      <tr>
        <th>Columna 1</th>
        <th>Columna 2</th>
        <th>Columna 3</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Dato 1</td>
        <td>Dato 2</td>
        <td>Dato 3</td>
      </tr>
    </tbody>
  </table>
</div>
```

## 🔧 Performance Optimizations

### ⚡ Lazy Loading
```javascript
// Lazy loading para imágenes
const imageObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      img.classList.remove('lazy');
      imageObserver.unobserve(img);
    }
  });
});

document.querySelectorAll('img[data-src]').forEach(img => {
  imageObserver.observe(img);
});
```

### 📊 Debounced Resize
```javascript
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

window.addEventListener('resize', debounce(() => {
  // Reajustar gráficos y mapas
  Chart.helpers.each(Chart.instances, (instance) => {
    instance.resize();
  });
}, 250));
```

### 🗃️ Memory Management
```javascript
// Limpiar instancias de Chart.js al cambiar de sección
function destroyCharts() {
  Chart.helpers.each(Chart.instances, (instance) => {
    instance.destroy();
  });
}

// Re-inicializar al volver a mostrar la sección
function initializeCharts() {
  // ... código de inicialización
}
```

## 🧪 Testing Strategy

### 🔍 Manual Testing Checklist
- [ ] Navegación entre secciones funciona
- [ ] Todos los botones de trazabilidad abren modal
- [ ] Mapas se cargan correctamente
- [ ] Gráficos se renderizan sin errores
- [ ] Filtros funcionan en sección de subvenciones
- [ ] Pestañas cambian contenido correctamente
- [ ] Responsive design se adapta en móvil/tablet
- [ ] Modal se puede cerrar con Escape y botón
- [ ] Códigos QR se generan correctamente
- [ ] Enlaces externos funcionan

### 🐛 Common Issues
```javascript
// Chart.js no se renderiza en móvil
// Solución: Especificar maintainAspectRatio: false

// Leaflet no carga correctamente
// Solución: Verificar que la altura del contenedor esté definida

// Modal no se cierra en móvil
// Solución: Verificar event listeners en touch events

// Performance en dispositivos lentos
// Solución: Implementar lazy loading y debouncing
```

## 🚀 Deployment Guidelines

### 📦 Build Process
```bash
# No requiere build process - archivos estáticos
# Comprimir imágenes para optimización
imagemin *.png --out-dir=dist/images

# Minificar CSS y JS (opcional)
terser scripts/main.js -o scripts/main.min.js
cleancss styles/main.css -o styles/main.min.css
```

### 🌐 Hosting Recommendations
- **GitHub Pages**: Gratuito, fácil para proyectos open source
- **Netlify**: Deploy automático desde Git
- **Vercel**: Optimizado para proyectos frontend
- **CloudFlare Pages**: CDN global incluido

### 🔒 Security Headers
```
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
Content-Security-Policy: default-src 'self' https://cdn.jsdelivr.net https://unpkg.com
```

## 🔄 Future Enhancements

### 🏗️ Planned Improvements
- [ ] **Progressive Web App (PWA)** para instalación móvil
- [ ] **Service Worker** para cache offline
- [ ] **Web Components** para reutilización
- [ ] **TypeScript** para mejor tipado
- [ ] **Unit Tests** con Jest
- [ ] **E2E Tests** con Cypress
- [ ] **CI/CD Pipeline** con GitHub Actions

### 📊 Data Integration
- [ ] **WebSocket** para datos en tiempo real
- [ ] **Server-Sent Events** para actualizaciones
- [ ] **IndexedDB** para cache local avanzado
- [ ] **Background Sync** para sincronización offline

---

*Esta documentación técnica complementa el README principal y proporciona detalles específicos para desarrolladores que contribuyan al proyecto.*