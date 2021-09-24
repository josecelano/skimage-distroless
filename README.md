## Skimage with docker

I can't run a Python script using scikit-image package and this docker iamge `gcr.io/distroless/python3-debian10`

I have created an issue here: https://github.com/scikit-image/scikit-image/issues/3832#issuecomment-926630019

Build:
```
docker build -t skimage-distroless .
```

Run:
```
docker run -it skimage-distroless
```

Run distroless debug image using `gcr.io/distroless/python3-debian10:debug` image:
```
docker run --entrypoint=sh -it skimage-distroless
```

## Problem

If you build and run the container you get this error:

```
(base) josecelano@josecelano:~/Documents/github/josecelano/skimage-distroless$ docker run -it skimage-distroless
Traceback (most recent call last):
  File "/app/skimage/__init__.py", line 121, in <module>
    from ._shared import geometry
ImportError: cannot import name 'geometry' from 'skimage._shared' (/app/skimage/_shared/__init__.py)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/app/main.py", line 1, in <module>
    from skimage import img_as_ubyte
  File "/app/skimage/__init__.py", line 124, in <module>
    _raise_build_error(e)
  File "/app/skimage/__init__.py", line 104, in _raise_build_error
    %s""" % (e, msg))
ImportError: cannot import name 'geometry' from 'skimage._shared' (/app/skimage/_shared/__init__.py)
It seems that scikit-image has not been built correctly.

Your install of scikit-image appears to be broken.
Try re-installing the package following the instructions at:
https://scikit-image.org/docs/stable/install.html 
```