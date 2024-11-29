# terraform-aws-network

AWS 네트워크 관련 자원 생성을 위한 terraform 모듈

### 개요

다음과 같은 자원들을 생성 함

- vpc
- public subnet
- private subnet

public subnet이 있는 경우에만 다음 자원들을 생성함

- internet gateway
- public route table
