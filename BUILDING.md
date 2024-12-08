## Installation

### Windows

1. Clone the repository:
    ```sh
    git clone --recursive https://github.com/ggjorven/VkChess.git
    cd VkChess
    ```

2. Navigate to the scripts folder:
    ```sh
    cd scripts/windows
    ```

3. Choose what you want it build to:
    - Visual Studio 17 2022:
        ```sh
        ./gen-vs2022.bat
        ```
    - MinGW make files:
        ```sh
        ./gen-make-%compiler%.bat
        ```

### Linux

1. Clone the repository:
    ```sh
    git clone --recursive https://github.com/ggjorven/VkChess.git
    cd VkChess
    ```

2. Navigate to the scripts folder:
    ```sh
    cd scripts/linux
    ```

3. (Optional) If you haven't already installed the premake5 build system you can install it like this:
    ```sh
    chmod +x install-premake5.sh
    ./install-premake5.sh
    ```

4. Generate make files:
    ```sh
    chmod +x gen-make-%compiler%.sh
    ./gen-make-%compiler%.sh
    ```

## Building

### Windows
- Visual Studio 17 2022:
    1. Navigate to the root of the directory
    2. Open the VkChess.sln file
    3. Start building in your desired configuration
    4. Build files can be in the bin/%Config%-windows/ folder.
    5. (Optional) Open a terminal and run the VkChess project:

        ```sh
        ./VkChess.exe 
        ```

- MinGW Make:
    1. Navigate to the root of the directory
    2. Open a terminal.
    3. Call make with desired configuration (debug, release or dist):

        ```sh
        make config=release
        ```

    5. Build files can be in the bin/%Config%-linux/ folder.
    6. (Optional) Open a terminal and run the VkChess project:
        ```sh
        ./VkChess.exe 
        ```

#### Actual build:

1. Navigate to the root of the directory
2. Open a terminal
3. Call make with desired configuration (debug, release or dist):

    ```sh
    make config=release
    ```

5. Build files can be in the bin/%Config%-linux/ folder.
6. (Optional) Open a terminal and run the VkChess project:

    ```sh
    chmod +x VkChess
    ./VkChess
    ```
