import setuptools

setuptools.setup(
    name="digidow-face-sensor-phofer", # Replace with your own username
    version="0.1.0",
    author="Martin Schwaighofer",
    description="A hello-world project for testing if TensorFlow 2 is properly installed and available via Nix on x86_64 and aarch64",
    packages=setuptools.find_packages(),
    scripts=['hello-tf.py'],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
    ],
    python_requires='>=3.6',
)

