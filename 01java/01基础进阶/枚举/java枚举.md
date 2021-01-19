#  枚举

枚举源码



```java
package java.lang;

import java.io.Serializable;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectStreamException;

public abstract class Enum<E extends Enum<E>>
        implements Comparable<E>, Serializable {

    private final String name;

    public final String name() {
        return name;
    }

    private final int ordinal;

    public final int ordinal() {
        return ordinal;
    }

    protected Enum(String name, int ordinal) {
        this.name = name;
        this.ordinal = ordinal;
    }

    public String toString() {
        return name;
    }

    public final boolean equals(Object other) {
        return this==other;
    }
    
    public final int hashCode() {
        return super.hashCode();
    }

    protected final Object clone() throws CloneNotSupportedException {
        throw new CloneNotSupportedException();
    }


    public final int compareTo(E o) {
        Enum<?> other = (Enum<?>)o;
        Enum<E> self = this;
        if (self.getClass() != other.getClass() && // optimization
            self.getDeclaringClass() != other.getDeclaringClass())
            throw new ClassCastException();
        return self.ordinal - other.ordinal;
    }

    @SuppressWarnings("unchecked")
    public final Class<E> getDeclaringClass() {
        Class<?> clazz = getClass();
        Class<?> zuper = clazz.getSuperclass();
        return (zuper == Enum.class) ? (Class<E>)clazz : (Class<E>)zuper;
    }

    public static <T extends Enum<T>> T valueOf(Class<T> enumType,
                                                String name) {
        T result = enumType.enumConstantDirectory().get(name);
        if (result != null)
            return result;
        if (name == null)
            throw new NullPointerException("Name is null");
        throw new IllegalArgumentException(
            "No enum constant " + enumType.getCanonicalName() + "." + name);
    }

    protected final void finalize() { }

    private void readObject(ObjectInputStream in) throws IOException,
        ClassNotFoundException {
        throw new InvalidObjectException("can't deserialize enum");
    }

    private void readObjectNoData() throws ObjectStreamException {
        throw new InvalidObjectException("can't deserialize enum");
    }
}

```

```java
/**
* Returns an array containing the constants of this enum 
* type, in the order they're declared.  This method may be
* used to iterate over the constants as follows:
*
*    for(E c : E.values())
*        System.out.println(c);
*
* @return an array containing the constants of this enum 
* type, in the order they're declared
*/
public static E[] values();

/**
* Returns the enum constant of this type with the specified
* name.
* The string must match exactly an identifier used to declare
* an enum constant in this type.  (Extraneous whitespace 
* characters are not permitted.)
* 
* @return the enum constant with the specified name
* @throws IllegalArgumentException if this enum type has no
* constant with the specified name
*/
public static E valueOf(String name);


https://docs.oracle.com/javase/specs/jls/se8/html/jls-8.html#jls-8.9
```



```java
 Note that for a particular enum type {@code T}, the
 implicitly declared {@code public static T valueOf(String)}
 method on that enum may be used instead of this method to map
 from a name to the corresponding enum constant.  All the
 constants of an enum type can be obtained by calling the
 implicit {@code public static T[] values()} method of that
 type.
```



```java
PS cd D:\git\java-dome\learn\target\classes\com\somin\枚举
PS D:\git\java-dome\learn\target\classes\com\somin\枚举> javap -c .\SeasonJavap.class
Compiled from "SeasonJavap.java"
public final class com.somin.枚举.SeasonJavap extends java.lang.Enum<com.somin.枚举.SeasonJavap> {
  public static final com.somin.枚举.SeasonJavap SPRING;

  public static final com.somin.枚举.SeasonJavap SUMMER;

  public static final com.somin.枚举.SeasonJavap AUTUMN;

  public static final com.somin.枚举.SeasonJavap WINTER;

  public static com.somin.枚举.SeasonJavap[] values();
    Code:
       0: getstatic     #1                  // Field $VALUES:[Lcom/somin/枚举/SeasonJavap;
       3: invokevirtual #2                  // Method "[Lcom/somin/枚举/SeasonJavap;".clone:()Ljava/lang/Object;
       6: checkcast     #3                  // class "[Lcom/somin/枚举/SeasonJavap;"
       9: areturn

  public static com.somin.枚举.SeasonJavap valueOf(java.lang.String);
    Code:
       0: ldc           #4                  // class com/somin/枚举/SeasonJavap
       2: aload_0
       3: invokestatic  #5                  // Method java/lang/Enum.valueOf:(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;
       6: checkcast     #4                  // class com/somin/枚举/SeasonJavap
       9: areturn

  static {};
    Code:
       0: new           #4                  // class com/somin/枚举/SeasonJavap
       3: dup
       4: ldc           #7                  // String SPRING
       6: iconst_0
       7: invokespecial #8                  // Method "<init>":(Ljava/lang/String;I)V
      10: putstatic     #9                  // Field SPRING:Lcom/somin/枚举/SeasonJavap;
      13: new           #4                  // class com/somin/枚举/SeasonJavap
      16: dup
      17: ldc           #10                 // String SUMMER
      19: iconst_1
      20: invokespecial #8                  // Method "<init>":(Ljava/lang/String;I)V
      23: putstatic     #11                 // Field SUMMER:Lcom/somin/枚举/SeasonJavap;
      26: new           #4                  // class com/somin/枚举/SeasonJavap
      29: dup
      30: ldc           #12                 // String AUTUMN
      32: iconst_2
      33: invokespecial #8                  // Method "<init>":(Ljava/lang/String;I)V
      36: putstatic     #13                 // Field AUTUMN:Lcom/somin/枚举/SeasonJavap;
      39: new           #4                  // class com/somin/枚举/SeasonJavap
      42: dup
      43: ldc           #14                 // String WINTER
      45: iconst_3
      46: invokespecial #8                  // Method "<init>":(Ljava/lang/String;I)V
      49: putstatic     #15                 // Field WINTER:Lcom/somin/枚举/SeasonJavap;
      52: iconst_4
      53: anewarray     #4                  // class com/somin/枚举/SeasonJavap
      56: dup
      57: iconst_0
      58: getstatic     #9                  // Field SPRING:Lcom/somin/枚举/SeasonJavap;
      61: aastore
      62: dup
      63: iconst_1
      64: getstatic     #11                 // Field SUMMER:Lcom/somin/枚举/SeasonJavap;
      67: aastore
      68: dup
      69: iconst_2
      70: getstatic     #13                 // Field AUTUMN:Lcom/somin/枚举/SeasonJavap;
      73: aastore
      74: dup
      75: iconst_3
      76: getstatic     #15                 // Field WINTER:Lcom/somin/枚举/SeasonJavap;
      79: aastore
      80: putstatic     #1                  // Field $VALUES:[Lcom/somin/枚举/SeasonJavap;
      83: return
}
```



```
由编译器生成的，在源代码中没有出现的，都会被标记为 synthetic。当然有一些例外的情况:默认的构造函数、类的初始化方法、以及枚举类中的 value 和 valueOf 方法
```

