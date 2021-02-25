# 部署流程

---

## 核心步骤

### 部署与运行loonflow

loonflow是作为最后方的工作流协调处理后端 该项目正常运行需要与loonflow进行数据交互
以下步骤以[开发环境]为步骤基准
- 该项目库不包含loonflow 需要去[loonflow](https://github.com/blackholll/loonflow)下载该后台引擎

1. 为loonflow安装对应的虚拟环境[建议python版本>3.6]
2. 启用虚拟环境,进入loonflow目录,执行pip install -r requirements/dev.txt安装开发环境需要的依赖包
    - 其中mysqlclient包可能会出现各种安装失败情况,建议手动在requirements/common.txt下将mysqlclient的指定版本号删除再进行安装
3. 确保mysql数据库,redis正在运行,将settings目录下`dev.py.simple`复制更名为`config.py`,并对其中内容进行编辑：
    - `DATABASES`为数据库配置，修改其中`NAME` `USER` `PASSWORD` `PROT` `HOST` 到当前开发环境数据库
    - `NAME`不建议修改，第5步导入数据与该名称有关，如果变动需要手动修改sql文件中指定数据库名称
    - `REDIS_`为redis相关配置 该引擎与redis有关的部分为生成流水单号与celery异步任务有关
    - `LOGGING`为日志相关配置
4. 执行以下命令以对当前项目model进行migrate操作并在数据库中创建表结构

```python
python manage.py makemigrations
python manage.py migrate
```

5. 执行 `mysql -uroot loonflow <loonflow_leave_data_demo.sql` 语句导入数据

6. 执行 `python manage.py runserver 8080` 启动后端服务

#### 登陆loonflow

数据中已有账户信息：

- 超级管理员账户
    - 'admin':`loonflow123`

- 普通用户
    - 教师用户
        -'teacherA':`123456`
        -'teacherB':`123456`

### 部署与运行shutongflow

shutongflow是前端调用方，该样例使用前后端分离，需要启动API服务与页面vue服务
以下步骤以[开发环境]为步骤基准

1. 为shutongflow安装对应的虚拟环境[建议python版本>3.6]
2. 启用虚拟环境,进入loonflow目录,执行pip install -r apps/requirements.txt
    - 其中mysqlclient包可能会出现各种安装失败情况,建议手动在requirements/common.txt下将mysqlclient的指定版本号删除再进行安装
3. 确保mysql数据库正在运行,对apps目录下`sttings.py`其中内容进行编辑：
    - `DATABASES`为数据库配置，修改其中`NAME` `USER` `PASSWORD` `PROT` `HOST` 到当前开发环境数据库
    - `NAME`不建议修改，第5步导入数据与该名称有关，如果变动需要手动修改sql文件中指定数据库名称
4. 进入apps目录,执行以下命令以对当前项目model进行migrate操作并在数据库中创建表结构

```python
python manage.py makemigrations
python manage.py migrate
```

5. 执行 `mysql -uroot shutongflow < ../shutongflow_leave_data_demo.sql` 语句导入数据

6. 执行 `python manage.py runserver 6060` 启动后端服务
    - 注意端口需要与 frontend/config/index.js中proxyTable的端口相同 否则前端部分无法访问该后端服务

7. 进入frontend目录 执行`npm install .`生成前端项目
    - 如果有warn提示使用`npm audit fix`处理

8. `npm run dev`启动前端项目，前段监听端口可在 frontend/config/index.js中配置port

#### 登陆shutongflow

数据中已有账户信息：

- 管理员账户
    - 'admin':`yxuqtr`

- 普通用户
    - 教师用户
        - 'teacherA':`asdasd`
        - 'teacherB':`asdasd`
    - 学生用户
        - 'student001':`asdasd`
        - 'student002':`asdasd`
        - 'student003':`asdasd`