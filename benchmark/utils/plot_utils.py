import tempfile
from pathlib import Path
import zipfile


def try_unzip(directory: str) -> Path:
    """Try to unzip a folder."""
    directory = Path(directory)
    is_zip = directory.suffix == ".zip"

    if not is_zip:
        return directory

    temp_directory = tempfile.mkdtemp()
    print(f"Unzip archive {directory} in {temp_directory}...")
    with zipfile.ZipFile(directory, 'r') as zip_ref:
        zip_ref.extractall(temp_directory)
    return Path(temp_directory) / directory.stem
