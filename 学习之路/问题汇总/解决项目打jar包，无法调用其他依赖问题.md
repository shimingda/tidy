# 解决maven项目打jar包，无法调用其他依赖问题

​	最近写了个工具，客户需要用jar运行，但是开始无法调用依赖jar，最终找到解决办法。

##加入maven插件

```
  </dependencies>
          <build>
                <finalName>import_tool</finalName>
         <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-dependency-plugin</artifactId>
                <executions>
                    <execution>
                        <id>copy</id>
                        <phase>install</phase>
                        <goals>
                            <goal>copy-dependencies</goal>
                        </goals>
                        <configuration>
                            <outputDirectory>${project.build.directory}/lib</outputDirectory>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <!--直接将所有依赖一起打包-->
           <plugin>  
            <groupId>org.apache.maven.plugins</groupId>  
            <artifactId>maven-assembly-plugin</artifactId>  
            <version>2.5.5</version>  
            <configuration>  
                <archive>  
                    <manifest>  
                    	<！--这里是项目主类运行入口-->
                        <mainClass>com.ds.tool.DownloadGUI</mainClass>  
                    </manifest>  
                </archive>  
                <descriptorRefs>  
                <!--打包后缀名称-->
                    <descriptorRef>jar-with-dependencies</descriptorRef>  
                </descriptorRefs>  
            </configuration>  
        </plugin>  
        </plugins>
```

## 执行指令

```
mvn assembly:assembly
```

##结果

刷新项目，在编译目录下会产生import_tool-jar-with-dependencies.jar，打包成功