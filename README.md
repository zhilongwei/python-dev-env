# python-dev-env

A Docker-based environment for Python development, featuring:

* Docker builds from a Dockerfile
* Git version control
* Seamless project migration
* Remote container support for VS Code
* Automatic code formatting
* Jupyter Notebook compatibility

## Usage
1. Build the Docker image from the `Dockerfile`, where you can specify the Python version, for example
    ```bash
    docker build -t python-dev:3.11 .
    ```

2. Update `.devcontainer/devcontainer.json` 
    Specify the correct image name in the `image` field, for example
    ```json
    "image": "python-dev:3.11"
    ```

3. Open in Container (VS Code).
    In Visual Studio Code, select “Remote-Containers: Open Folder in Container…” to launch your Python development workspace inside the container.

## Python Packages

The `requirements.txt` file includes several essential Python libraries, such as:

- `numpy`, `scipy`, and `sympy` (scientific computing and symbolic math)  
- `matplotlib` (data visualization)  
- `jupyter` and `ipykernel` (Jupyter Notebook support)  
- `black` (code formatting)  

Users can freely add more packages and specify versions as needed to customize the environment.

## Documentation Generation

1. Use sphinx-apidoc to generate the .rst files needed to document them:
    ```bash
    # From your project's root (where docs folder is present):
    sphinx-apidoc -o docs/source/ .
    ```

2. Inside the `docs/` directory, run:
    ```bash
    make clean
    make html
    ```

3. Auto-reloading as you edit docs, run
    ```
    sphinx-autobuild source build/html
    ```
    inside the docs directory. Then open http://127.0.0.1:8000 in your browser. Each time you change a file in `source/`, it rebuilds automatically.