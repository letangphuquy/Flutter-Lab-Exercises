import os
import sys

def print_first_level_tree(root):
    """Prints the first-level subfolders and files under the root directory."""
    print(f"{os.path.basename(root)}/")
    items = sorted(os.listdir(root))
    for i, item in enumerate(items):
        prefix = "└── " if i == len(items) - 1 else "├── "
        item_path = os.path.join(root, item)
        if os.path.isdir(item_path):
            print(f"{prefix}{item}/")
        else:
            print(f"{prefix}{item}")

def print_subfolder_tree(path, indent=0):
    """Recursively prints the directory structure starting from the given path."""
    items = sorted(os.listdir(path))
    for i, item in enumerate(items):
        item_path = os.path.join(path, item)
        if i == len(items) - 1:
            print(" " * indent + "└── " + item)
            if os.path.isdir(item_path):
                print_subfolder_tree(item_path, indent + 4)
        else:
            print(" " * indent + "├── " + item)
            if os.path.isdir(item_path):
                print_subfolder_tree(item_path, indent + 4)

def find_dart_files(root, allowed_subfolders):
    """Finds .dart files only in allowed first-level subfolders and their subdirectories."""
    dart_files = []
    for subfolder in allowed_subfolders:
        subfolder_path = os.path.join(root, subfolder)
        if os.path.isdir(subfolder_path):
            for dirpath, _, filenames in os.walk(subfolder_path):
                for filename in filenames:
                    if filename.endswith('.dart'):
                        full_path = os.path.join(dirpath, filename)
                        rel_path = os.path.relpath(full_path, root)
                        dart_files.append(rel_path)
    return dart_files

def main(root):
    # Define the constant list of allowed first-level subfolders
    ALLOWED_SUBFOLDERS = ['lib', 'images', 'fonts']  # Modify this list as needed
    print("Project structure:")
    print_first_level_tree(root)
    
    # Print the directory structure for each allowed subfolder
    for subfolder in ALLOWED_SUBFOLDERS:
        subfolder_path = os.path.join(root, subfolder)
        if os.path.isdir(subfolder_path):
            print(f"\n{subfolder}/")
            print_subfolder_tree(subfolder_path, indent=4)
    
    print("\nFiles:")
    dart_files = find_dart_files(root, ALLOWED_SUBFOLDERS)
    for file_path in dart_files:
        full_path = os.path.join(root, file_path)
        try:
            with open(full_path, 'r', encoding='utf-8') as f:
                content = f.read()
            print(f"=== File: {file_path} ===")
            print(content)
            print("=== End of file ===")
        except Exception as e:
            print(f"Error reading {file_path}: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python list_dart_project_modified.py <project_root>")
        sys.exit(1)
    root = sys.argv[1]
    main(root)