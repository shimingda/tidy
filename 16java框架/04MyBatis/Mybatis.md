# Mybatis

## SqlSession对象

### SqlSession session = sqlSessionFactory.openSession();
UserMapper userMapper = session.getMapper(UserMapper.class);
List<LwUser> userList = userMapper.listUserByUserName("孤狼1号");

## 获取Mapper接口

### SqlSession对象是获取一个Mapper接口

### 在调用getMapper之后，会去Configuration对象中获取Mapper对象，因为在项目启动的时候就会把Mapper接口加载并解析存储到Configuration对象

### 通过Configuration对象中的MapperRegistry对象属性，继续调用getMapper方法

### 根据type类型，从MapperRegistry对象中的knownMappers获取到当前类型对应的代理工厂类，然后通过代理工厂类生成对应Mapper的代理类

### 最终获取到我们接口对应的代理类MapperProxy对象

### 而MapperProxy可以看到实现了InvocationHandler，使用的就是JDK动态代理。

## Mapper接口和映射文件是如何进行绑定的

### Mapper接口及其映射文件是在加载mybatis-config配置文件的时候存储进去的

### 1、首先我们会手动调用SqlSessionFactory方法中的build()方法：

### 2、然后会构造一个XMLConfigBuilder对象，并调用其parse方法：

### 3、然后会继续调用自己的parseConfiguration来解析配置文件，这里面就会分别去解析全局配置文件的顶级节点，其他的我们先不看，我们直接看最后解析mappers节点。

### 4、继续调用自己的mapperElement来解析mappers文件

### 5、直接配置xml映射文件的解析方式，会构建一个XMLMapperBuilder对象并调用其parse方法。

### 6、解析完映射文件之后，调用自身方法bindMapperForNamespace，开始绑定Mapper接口和映射文件

### 7、调用Configuration对象的addMapper

### 8、调用Configuration对象的属性MapperRegistry内的addMapper方法，这个方法就是正式将Mapper接口添加到knownMappers

## MyBatis中SQL语句的执行流程

### 一、寻找sql

- 1、了解代理模式的应该都知道，调用被代理对象的方法之后实际上执行的就是代理对象的invoke方法
- 2.调用MapperProxy内部类MapperMethodInvoker中的方法cachedInvoker
- 3、接下来，是构造一个MapperMethod对象,这个对象封装了Mapper接口中对应的方法信息以及对应的sql语句信息：

	- 这里面就会把要执行的sql语句，请求参数，方法返回值全部解析封装成MapperMethod对象，然后后面就可以开始准备执行sql语句了

### 二、执行sql语句

- 1.MapperMethod继续上面的流程进入execute方法：
- 2、这里面会根据语句类型以及返回值类型来决定如何执行，本人这里返回的是一个集合，故而我们进入executeForMany方法
- 3、这里面首先会将前面存好的参数进行一次转换，然后绕了这么一圈，回到了起点SqlSession对象，继续调用selectList方法
- 4、接下来又讲流程委派给了Execute去执行query方法，最终又会去调用queryFromDatabase方法
- 5、到这里之后，终于要进入正题了，一般带了这种do开头的方法就是真正做事的，Spring中很多地方也是采用的这种命名方式：

	- 注意，前面我们的sql语句还是占位符的方式，并没有将参数设置进去，所以这里在return上面一行调用prepareStatement方法创建Statement对象的时候会去设置参数，替换占位符。
	- 参数如何设置我们先跳过，等把流程执行完了我们在单独分析参数映射和结果集映射。

- 6、继续进入PreparedStatementHandler对象的query方法，可以看到，这一步就是调用了jdbc操作对象PreparedStatement中的execute方法，最后一步就是转换结果集然后返回。

*XMind: ZEN - Trial Version*