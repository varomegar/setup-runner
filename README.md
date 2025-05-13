# 🚀 setup-runner GitHub Action

Esta acción permite instalar tecnologías específicas en el runner de GitHub Actions usando un único input de configuración.

---

## 📦 Tecnologías Soportadas

Esta Action puede instalar las siguientes tecnologías:

- **Lenguajes y entornos**:  
  - `java:<versión>`  
  - `python:<versión>`  
  - `node:<versión>`  
  - `go:<versión>`  

- **CLIs de nube**:  
  - `azure` (Azure CLI)  
  - `aws` (AWS CLI)  
  - `oc` (Red Hat OpenShift CLI)  
  - `ibm` (IBM Cloud CLI)

- **Otras herramientas**:  
  - `psql` (PostgreSQL CLI)  
  - `ansible`

---

## 📥 Inputs

### `techs` (obligatorio)

Cadena de texto con tecnologías a instalar separadas por coma.  
Formato: `tecnologia[:versión]`

Si no se especifica versión, se instalará la última disponible.

#### Ejemplo:

```yaml
jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Instalar tecnologías necesarias
        uses: Varomegar/setup-runner@v1
        with:
          techs: >
            java:17,
            python,
            azure,
            aws,
            oc,
            ibm,
            psql,
            ansible

