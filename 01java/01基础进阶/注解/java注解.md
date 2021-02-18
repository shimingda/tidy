# java注解
>注解的使用核心处理就是利用反射获取注解，注解内容本身较少，想使用好注解更多的在于设计代码的能力，如何使用[反射](https://blog.csdn.net/smd2575624555/article/details/90483448)
## 元注解
### @Target
>表示注解可以用于哪些地方。

ElementType 参数包括：
1. CONSTRUCTOR：构造器的声明；
2. FIELD：字段声明（包括 enum 实例）；
3. LOCAL_VARIABLE：局部变量声明；
4. METHOD：方法声明；
5. PACKAGE：包声明；
6. PARAMETER：参数声明；
7. TYPE：类、接口（包括注解类型）或者 enum 声明。
###  @Retention
> 表示注解信息保存的时长。

RetentionPolicy 参数包括：
1. SOURCE：注解将被编译器丢弃；
2. CLASS：注解在 class 文件中可用，但是会被 VM 丢弃；
3. RUNTIME：VM 将在运行期也保留注解，因此可以通过反射机制读取注解的信息
### @Documented
> 将此注解保存在 Javadoc 中
### @Inherited
> 允许子类继承父类的注解
### @Repeatable
> 允许一个注解可以被使用一次或者多次（Java 8）。
## 注解元素
1. 所有基本类型（int、float、boolean等）
2. String
3. Class
4. enum
5. Annotation
6. 以上类型的数组
		如果你使用了其他类型，编译器就会报错。
## 默认值限制
- 元素要么有默认值，要么就在使用注解时提供元素的值。
- 不能使用 null 作为其值
		习惯用法:空字符串或者负数用于表达某个元素不存在

## 注解不支持继承
## 注解代码例子

```
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface UseCase
{
	int id();
	String description() default "no description";
}
```
```
import java.util.List;

public class UseCaseUtils
{
	@UseCase(id = 47, description = "case1")
	public boolean case1(String param) {
		return true;
	}
	@UseCase(id = 48)
	public String case2(String param) {
		return param;
	}
	@UseCase(id = 49, description = "case3")
	public boolean case3(List<String> params, String param) {
		return true;
	}
}
```
```java
import java.lang.reflect.Method;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class UseCaseTracker
{
	public static void
	trackUseCases(List<Integer> useCases, Class<?> cl) {
		for(Method m : cl.getDeclaredMethods()) {
			UseCase uc = m.getAnnotation(UseCase.class);//核心处理就是利用反射获取注解
			if(uc != null) {
				System.out.println("Found Use Case " + uc.id() +" " + uc.description());
				useCases.remove(Integer.valueOf(uc.id()));
			}
		}
		useCases.forEach(i ->
				System.out.println("Missing use case " + i));
	}
	public static void main(String[] args) {
		List<Integer> useCases = IntStream.range(47, 51).boxed().collect(Collectors.toList());
		trackUseCases(useCases, UseCaseUtils.class);
	}
}

```