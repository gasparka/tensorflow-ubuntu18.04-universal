# TensorFlow Ubuntu18.04 Universal (GPU/CPU)
Notable Upgrades:
1. Python 3.6.7
   1. Support "f-strings" ([PEP498](https://www.python.org/dev/peps/pep-0498/))
   2. Support variable annotations ([PEP526](https://www.python.org/dev/peps/pep-0526/))
   3. Support Data Classes ([PEP557](https://www.python.org/dev/peps/pep-0557/))
2. Support GPU and CPU in single image (credits to @tillahoffmann)

Train MNIST on CPU:
```shell
docker run gasparka/tensorflow-ubuntu18.04-universal
```

Train MNIST on GPU:
```shell
docker run --runtime=nvidia gasparka/tensorflow-ubuntu18.04-universal
```
