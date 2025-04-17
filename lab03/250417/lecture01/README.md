# 설명서
- ubuntu 24.04 이미지 만들기 

# 도커파일로 이미지 빌드하기
- docker image build [OPTIONS]
    + --file : 도커파일 지정 ==> .
    + --tag : 작성한 이미지에 태그를 붙임. 

# 컨테이너 실행
- 컨테이너 실행
```bash
$ docker container run my-ubuntu:24.04 echo 'hello'
hello
```

- 도커 히스토리
```bash
$ docker image history my-ubuntu:24.04
IMAGE          CREATED      CREATED BY                                       SIZE      COMMENT
42e56aaf8bb0   8 days ago   /bin/sh -c #(nop)  CMD ["/bin/bash"]             0B
<missing>      8 days ago   /bin/sh -c #(nop) ADD file:1d7c45546e94b90e9…   87.6MB
<missing>      8 days ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
<missing>      8 days ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
<missing>      8 days ago   /bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH      0B
<missing>      8 days ago   /bin/sh -c #(nop)  ARG RELEASE                   0B
```
