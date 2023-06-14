# jupyter-tmux-docker

![스크린샷 2023-06-14 오후 2 07 26](https://github.com/luckydoyun/jupyter-tmux-docker/assets/110095743/c6a000b3-c421-4532-ab73-f28f8063018d)

## How Install?

### 1. Create docker image
```
docker build -t <tagName>:<version> .

ex) docker build -t luckydoyun:1.0 .
```

### 2. Create container using image file
```
docker run -it -d -p 1008:8888 --name <containerName> <tagName>:<version>

ex) docker run -it -d -p 1008:8888 --name lucky luckydoyun:1.0
```

### 3. Check your containers in docker
```
docker ps
```

### 4. Connect to container
```
docker attach <containerName>
```

### 5. Set jupyter notebook password
```
jupyter notebook password
```

### 6. Create tmux session
```
tmux new -s <name>
```

### 7. Connect to tmux session
```
tmux attach -t <name>
```

### 8. Execute jupyter notebook
```
jupyter notebook
```

### 9. Try this in your browser
```
http://localhost:1008
```

### 10. If you have '404 GET/static/components/marked/lib/marked.js', click this url.
https://stackoverflow.com/questions/75539135/jupyter-nbextensions-doesn´t-appear-404-get-static-components-marked-lib-mark
