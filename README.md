# 🚀 setup-runner GitHub Action

This action allows you to install specific technologies on the GitHub Actions runner using a single configuration input.

---

## 📦 Supported Technologies

This action can currently install the following technologies:

- **Languages and runtimes**:  
  - `java:<version>`  
  - `python:<version>`  
  - `node:<version>`  
  - `go:<version>`  

- **Cloud CLIs**:  
  - `azure` (Azure CLI)  
  - `aws` (AWS CLI)  
  - `oc` (Red Hat OpenShift CLI)  
  - `ibm` (IBM Cloud CLI)

- **Other tools**:  
  - `psql` (PostgreSQL CLI)  
  - `ansible`

> 🛠️ *More technologies will be added over time. If you'd like to contribute, feel free to open a pull request to the `main` branch!*

---

## 📥 Inputs

### `techs` (required)

A comma-separated string of technologies to install.  
Format: `technology[:version]`

If the version is not specified, the latest available version will be installed.

#### Example:

```yaml
jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Install required technologies
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
