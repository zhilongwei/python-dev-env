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