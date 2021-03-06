#JAVA 基础

> @author shimingda

## 类加载

####顺序

```
1.父类--静态变量
2.父类--静态初始化块
3.子类--静态变量
4.子类--静态初始化块
5.父类--变量
6.父类--初始化块
7.父类--构造器
8.子类--变量
9.子类--初始化块
10.子类--构造器 
```

#### 类覆盖

```
1. 由于private变量受访问权限的限制，它不能被覆盖。
2. 属性的值取父类还是子类并不取决于我们创建对象的类型，而是取决于我们定义的变量的类型。
3. friendly、protected和public修饰符并不影响属性的覆盖。
4. 静态变量和静态常量属于类，不属于对象，因此它们不能被覆盖。
5. 常量可以被覆盖。
6. 对于基本类型和对象，它们适用同样的覆盖规律。 
```

### 创建对象

```
1.使用new创建对象 使用new关键字创建对象应该是最常见的一种方式，但我们应该知道，使用new创建对象会增加耦合度。无论使用什么框架，都要减少new的使用以降低耦合度。
2.使用反射的机制创建对象 使用Class类的newInstance方法
3.采用clone clone时，需要已经有一个分配了内存的源对象，创建新对象时，首先应该分配一个和源对象一样大的内存空间。要调用clone方法需要实现Cloneable接口
4.采用序列化机制 使用序列化时，要实现实现Serializable接口，将一个对象序列化到磁盘上，而采用反序列化可以将磁盘上的对象信息转化到内存中。
```



## 原始类型与引用类型

### 值传递和引用传递

> 对象传递属于值传递，例如，方法set方法，赋值没有返回值，依旧能改变属性
>
> 原始类型传递是引用传递，更改值原属性不改变

### short s1 = 1; s1 = s1 + 1;有什么错? short s1 = 1; s1 +=1;有什么错?

- 对于short s1=1;s1=s1+1来说，在s1+1运算时会自动提升表达式的类型为int，那么将int赋予给short类型的变量s1会出现类型转换错误。
- 对于short s1=1;s1+=1来说 +=是java语言规定的运算符，java编译器会对它进行特殊处理，因此可以正确编译。

### 自动拆装箱

​		对于两个非new生成的Integer对象，进行比较时，如果两个变量的值在区间-128到127之间，则比较结果为true，如果两个变量的值不在此区间，则比较结果为false

 		java在编译Integer i = 100 ;时，会翻译成为Integer i = Integer.valueOf(100)；，而java API中对Integer类型的valueOf的定义如下：

​		java对于-128到127之间的数，会进行缓存，Integer i = 127时，会将127进行缓存，下次再写Integer j = 127时，就会直接从缓存中取，就不会new了

```
public static Integer valueOf(int i){
    assert IntegerCache.high >= 127;
    if (i >= IntegerCache.low && i <= IntegerCache.high){
        return IntegerCache.cache[i + (-IntegerCache.low)];
    }
    return new Integer(i);
}
```

## String

### String所有内容

https://blog.csdn.net/smd2575624555/article/details/104000831

### "==",equals()和hashCode

https://blog.csdn.net/smd2575624555/article/details/103911826

## 多线程

#### 多线程

#####多线程状态

```
new，runnable，blocked，waitting，timed_witting，terminated
```

#####多线程的实现方式

```
    1.extends Thread  @Override public void run(){...}
    2.implements Runnable @Override public void run(){...}
    3.implements Callable<X> @Override public X call(){...}
      第三种实现Callable接口的方式弥补了原本Runnable接口当中run()的两个不足
          run()方法定义为void方法 所以无法返回结果
          方法没有throws声明所以没法抛出异常
```

####线程池

#####线程池类型

> 线程池类型一共有四种，我个人认为划分方式是根据线程池容量大小进行划分

######newSingleThreadExecutor

​	创建一个单线程化的Executor，即只创建唯一的工作者线程来执行任务，它只会用唯一的工作线程来执行任务，保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行。如果这个线程异常结束，会有另一个取代它，保证顺序执行。单工作线程最大的特点是可保证顺序地执行各个任务，并且在任意给定的时间不会有多个线程是活动的。

######newFixedThreadPool

​	创建一个指定工作线程数量的线程池。每当提交一个任务就创建一个工作线程，如果工作线程数量达到线程池初始的最大数，则将提交的任务存入到池队列中。

​	FixedThreadPool是一个典型且优秀的线程池，它具有线程池提高程序效率和节省创建线程时所耗的开销的优点。但是，在线程池空闲时，即线程池中没有可运行任务时，它不会释放工作线程，还会占用一定的系统资源。

######newCachedThreadPool

​	创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程。这种类型的线程池特点是：

- 工作线程的创建数量几乎没有限制(其实也有限制的,数目为Interger. MAX_VALUE), 这样可灵活的往线程池中添加线程。
- 如果长时间没有往线程池中提交任务，即如果工作线程空闲了指定的时间(默认为1分钟)，则该工作线程将自动终止。终止后，如果你又提交了新的任务，则线程池重新创建一个工作线程。
- 在使用CachedThreadPool时，一定要注意控制任务的数量，否则，由于大量线程同时运行，很有会造成系统瘫痪。

###### newScheduleThreadPool

创建一个定长的线程池，而且支持定时的以及周期性的任务执行，支持定时及周期性任务执行。

##### 线程池如何初始化

线程池初始化是单例模型，封装静态

####执行顺序
1. 当线程数小于核心线程数时，创建线程。

2. 当线程数大于等于核心线程数，且任务队列未满时，将任务放入任务队列。

3. 当线程数大于等于核心线程数，且任务队列已满

   ​	a. 若线程数小于最大线程数，创建线程

   ​	b. 若线程数等于最大线程数，抛出异常，拒绝任务

#####线程池个数

```
private static final int NCPU = Runtime.getRuntime().availableProcessors();
 
private static final ThreadPoolExecutor THREAD_POOL_EXECUTOR = new ThreadPoolBuilder.FixedThreadPoolBuilder()
        .setThreadFactory(new NamedThreadFactory(THREAD_NAME_PREFIX))
        .setPoolSize((NCPU - 1) * 2).setRejectHanlder(new AbortPolicyWithReport(THREAD_NAME_PREFIX)).build();

```

#####连接池的优点和原理

​	“数据库连接”是一种稀缺的资源，为了保障网站的正常使用，应该对其进行妥善管理。其实我们查询完数据库后，如果不关闭连接，而是暂时存放起来，当别人使用时，把这个连接给他们使用。就避免了一次建立数据库连接和断开的操作时间消耗。

我们自己尝试开发一个连接池，来为上面的查询业务提供数据库连接服务：

​       ①   编写class 实现DataSource 接口

​       ②   在class构造器一次性创建10个连接，将连接保存LinkedList中

​       ③   实现getConnection  从 LinkedList中返回一个连接

​       ④   提供将连接放回连接池中方法

#####链接池的实现

```
    //查询所有用户  
    Public void FindAllUsers(){  
           //1、使用连接池建立数据库连接  
           MyDataSource dataSource = new MyDataSource();  
           Connection conn =dataSource.getConnection();          
           //2、创建状态  
           Statement state =con.createStatement();             
           //3、查询数据库并返回结果  
           ResultSet result =state.executeQuery("select * from users");             
           //4、输出查询结果  
           while(result.next()){  
                  System.out.println(result.getString("email"));  
           }              
           //5、断开数据库连接  
           result.close();  
           state.close();  
           //6、归还数据库连接给连接池  
           dataSource.releaseConnection(conn);  
     }  
```



```
    public class MyDataSource implements DataSource {  
              //链表 --- 实现栈结构  
              privateLinkedList<Connection> dataSources = new LinkedList<Connection>();  
      
              //初始化连接数量  
              publicMyDataSource() {  
                     //一次性创建10个连接  
                     for(int i = 0; i < 10; i++) {  
                            try {  
                               //1、装载sqlserver驱动对象  
                               DriverManager.registerDriver(new SQLServerDriver());  
                               //2、通过JDBC建立数据库连接  
                               Connection con =DriverManager.getConnection(  
                                  "jdbc:sqlserver://192.168.2.6:1433;DatabaseName=customer", "sa", "123");  
                               //3、将连接加入连接池中  
                               dataSources.add(con);  
                            } catch (Exception e) {  
                               e.printStackTrace();  
                            }  
                     }  
              }  
      
              @Override  
              publicConnection getConnection() throws SQLException {  
                     //取出连接池中一个连接  
                     finalConnection conn = dataSources.removeFirst(); // 删除第一个连接返回  
                     returnconn;  
              }  
      
              //将连接放回连接池  
              publicvoid releaseConnection(Connection conn) {  
                     dataSources.add(conn);  
                     }  
       }  
```

```
    //查询所有用户  
    Public void FindAllUsers(){  
           //1、使用连接池建立数据库连接  
           MyDataSource dataSource = new MyDataSource();  
           Connection conn =dataSource.getConnection();          
           //2、创建状态  
           Statement state =con.createStatement();             
           //3、查询数据库并返回结果  
           ResultSet result =state.executeQuery("select * from users");             
           //4、输出查询结果  
           while(result.next()){  
                  System.out.println(result.getString("email"));  
           }              
           //5、断开数据库连接  
           result.close();  
           state.close();  
           //6、归还数据库连接给连接池  
           dataSource.releaseConnection(conn);  
     }  
```



###集合框架

Collection
├List
│├LinkedList
│├ArrayList
│└Vector
│　└Stack
└Set
Map
├Hashtable
├HashMap
└WeakHashMap
Collection是最基本的集合接口，一个Collection代表一组Object，即Collection的元素（Elements）n

###异常

####异常层次

所有的异常都来源于Throwable。

下一层分解为两个分支：Error和Exception。

Exceptin下面又分为两个分支：RuntimeExceptiom和IOExcption.

RuntimeException的异常主要包涵一下接种情况：

1. 错误类型转化
2. 数组访问越界
3. 访问空指针

IOException主要包括：

1. 试图打开一个不存在的文件
2. 试图在文件尾部读取数据

#### 手动处理异常

 throw new Exception();

####大型项目中项目处理

在控制层统一拦截异常信息，配置全局拦截器

####捕捉异常

通常不建议进行异常捕捉，代码形式不优雅，影响代码整体协调性，且耗费资源。非脏数据处理建议使用手动抛出。

try{

}catch{

}catch{

}...catch{

}finally{

}

不允许在捕捉异常的方法体内声明新的异常,新抛出异常将覆盖原来的异常

例如

try{

}catch{

throw new Exception();

}

####处理系统错误的3个机制

1. 抛出异常
2. 打印日志
3. 使用断言

### 日志

####日志级别

debug->info(默认)->warn->error->fatal

开发时使用info

线上环境使用debug

### 泛型

泛型的使用意味着很多代码可以被不同的对象重用。代码的重用很多时候都设计到了转型，但是泛型提供了一个类型参数。提高了代码的可读性，还去除了编译器的转型操作。

###hashCode，equals和==

本质区别在于==比较的是内存，equals比较的是引用，hashCode对比是不是一致的存在

###作用域

public,private,protected,以及不写时的区别
区别如下：
作用域      当前类   同一package    子孙类     其他package
public       √        √             √           √
protected    √        √             √           ×
friendly     √        √             ×           ×
private      √        ×             ×           ×
不写时默认为friendly



## web开发

###RESTFul接口

>直接使用HTTP+JSON，也就是用RESTful的方式来开发

#### REST架构风格重要约束

#####客户-服务器（Client-Server）

通信只能由客户端单方面发起，表现为请求-响应的形式。

#####无状态（Stateless）

通信的会话状态（Session State）应该全部由客户端负责维护。

##### 缓存（Cache）

响应内容可以在通信链的某处被缓存，以改善网络效率。

##### 统一接口（Uniform Interface）

通信链的组件之间通过统一的接口相互通信，以提高交互的可见性。

#####分层系统（Layered System）

通过限制组件的行为（即，每个组件只能“看到”与其交互的紧邻层），将架构分解为若干等级的层。

##### 按需代码（Code-On-Demand，可选）

支持通过下载并执行一些代码（例如Java Applet、Flash或JavaScript），对客户端的功能进行扩展。

####深入理解REST

1. 资源（Resource）
2. 资源的表述（Representation）
3. 状态转移（State Transfer）
4. 统一接口（Uniform Interface）
5. 超文本驱动（Hypertext Driven）

###四种会话跟踪技术 

会话作用域 ServletsJSP 页面描述 

​	page 否是代表与一个页面相关的对象和属性。一个页面由一个编译好的 Java servlet 类（可以带有任何的 include 指令，但是没有 include 动作）表示。这既包括 servlet 又包括被编译成 servlet 的 JSP 页面 

​	request 是是代表与 Web 客户机发出的一个请求相关的对象和属性。一个请求可能跨越多个页面，涉及多个 Web 组件（由于 forward 指令和 include 动作的关系） 

​	session 是是代表与用于某个 Web 客户机的一个用户体验相关的对象和属性。一个 Web 会话可以也经常会跨越多个客户机请求

​	application 是是代表与整个 Web 应用程序相关的对象和属性。这实质上是跨越整个 Web 应用程序，包括多个页面、请求	和会话的一个全局作用域 

###web.xml作用

web.xml文件是用来初始化配置信息：比如Welcome页面、servlet、servlet-mapping、filter、listener、启动加载级别等。

当你的web工程没用到这些时，你可以不用web.xml文件来配置你的Application。 

##区别对比

###run和start的区别

####start()

> 它的作用是启动一个新线程，新线程会执行相应的run()方法。start()不能被重复调用。

####run()

> run()就和普通的成员方法一样，可以被重复调用。单独调用run()的话，会在当前线程中执行run()，而并不会启动新线程！

###String 和 StringBuffer

> 首先它们都表示Java中的字符串，底层都是基于char类型的数组实现的

1. 对于它们之间的区别，第一个底层开辟的内存空间的差距，对于String来说，每创建一个String类型的对象，底层都会开辟一个数组对象，这个数组对象多大空间完全取决于字符串的字符个数，而对于StringBuffer来说，每创建一个StringBuffer对象，底层也是会开辟一个char类型的数组，只是这个数组对象的空间大小不但要看字符串的字符个数，还要多预留16块缓冲区，用来追加信息，所以当我们不断的在字符串的后面追加新内容的时候，StringBuffer的效率更高。


2. 对于String类里面那些改变字符串内容的方法都不会直接操作原本的字符串，而且将符合条件的字符串返回给我们，所以需要拿着一个变量去接收 比如substring方法。而对于StringBuffer里面的一些改变字符串的方法就能直接的对原本字符串进行操作，不需要再接收 比如reverse() insert() append()

### 注解Resource和Autowired区别

 ```
Autowired：注入  只找类型
Resource ：注入  jdk注解
 ```

### ArrayList和Vector的区别

1. 同步性:Vector是线程安全的，也就是说是同步的，而ArrayList是线程序不安全的，不是同步的
2. .数据增长:当需要增长时,Vector默认增长为原来一培，而ArrayList却是原来的一半

###说出 ArrayList,Vector, LinkedList 的存储性能和特性

​	ArrayList 和 Vector 都是使用数组方式存储数据，此数组元素数大于实际存储的数据以便增加和插入元素，它们都允许直接按序号索引元素，但是插入元素要涉及数组元素移动等内存操作，所以索引数据快而插入数据慢，Vector 由于使用了 synchronized 方法（线程安全），通常性能上较 ArrayList 差，而 LinkedList 使用双向链表实现存储，按序号索引数据需要进行前向或后向遍历，但是插入数据时只需要记录本项的前后项即可，所以插入速度较快。 

### HashMap和Hashtable的区别

1. 历史原因:Hashtable是基于陈旧的Dictionary类的，HashMap是Java 1.2引进的Map接口的一个实现
2. 同步性:Hashtable是线程安全的，也就是说是同步的，而HashMap是线程序不安全的，不是同步的
3. 值：只有HashMap可以让你将空值作为一个表的条目的key或value

###error和exception的区别

error 表示一种严重问题。比如说内存溢出。不可能指望程序能处理这样的情况。
exception 表示可以处理的问题。

### Overload和Override的区别

如果在子类中定义某方法与其父类有相同的名称和参数，我们说该方法被重写(Overriding)。子类的对象使用这个方法时，将调用子类中的定义，对它而言，父类中的定义如同被“屏蔽”了。

如果在一个类中定义了多个同名的方法，它们或有不同的参数个数或有不同的参数类型，则称为方法的重载(Overloading)。Overloaded的方法是可以改变返回值的类型。

###数组和vector的区别

数组不可以随时改变大小，可以保存引用类型的数据和基本类型的数据。

Vector 可以随时改变大小，只可以保存引用类型的数据。

### myBatis中#与$的区别



```
name="abc"
select * from user where name = #{name}; 
```

\#{} 在动态解析的时候， 会解析成一个参数标记符。就是解析之后的语句是：

```
select * from user where name = ？; 
```

${}

```
name="abc"
select * from user where name = '${name}'; 
```

${}在动态解析的时候，会将我们传入的参数当做String字符串填充到我们的语句中，就会变成下面的语句

```
select * from user where name = "abc"; 
```
###抽象类与接口的区别

答：抽象类与接口都用于抽象，但是抽象类(JAVA中)可以有自己的部分实现，而接口则完全是一个标识(同时有多重继承的功能)。 
JAVA类实现序例化的方法是实现java.io.Serializable接口
Collection框架中实现比较要实现Comparable 接口和 Comparator 接口

###int 和 Integer 有什么区别

​	Java 提供两种不同的类型：引用类型和原始类型（或内置类型）。

​	Int是java的原始数据类型，Integer是java为int提供的封装类。Java为每个原始类型提供了封装类。
​	原始类型封装类,booleanBoolean,charCharacter,byteByte,shortShort,intInteger,longLong,floatFloat,doubleDouble
引用类型和原始类型的行为完全不同，并且它们具有不同的语义。

​	引用类型和原始类型具有不同的特征和用法，它们包括：大小和速度问题，这种类型以哪种类型的数据结构存储，当引用类型和原始类型用作某个类的实例数据时所指定的缺省值。对象引用实例变量的缺省值为 null，而原始类型实例变量的缺省值与它们的类型有

###synchronized 和 Lock 的异同

主要相同点：Lock 能完成 synchronized 所实现的所有功能 

主要不同点：Lock 有比 synchronized 更精确的线程语义和更好的性能。synchronized 会自动释放锁，而 Lock 一定要求程序员手工释放，并且必须在 finally 从句中释放。 