#URI设计原则

> @author Simon 

###url等级区分

```
优雅型：http://api.exapmle.com/louvre/da-vinci/mona-list/卢浮宫/达芬奇/蒙娜丽莎
中庸型：http://api.exapmle.com/bj/2000000042/北京/新闻频道/新闻ID
谢特型：http://api.example.com/68dd0-a9d3-11e0-9f1c 
```

###分享URI设计的一些原则

####斜杠分隔符（/）必须用于显示层次关系 

  ```
正例: http://api.canvas.com/shapes/polygons/quadrilaterals/square
反例: http://api.canvas.com/shapes/polygons/quadrilaterals_squares
  ```

####使用“-”提高URI的可读性

```
正例：http://api.example.com/blogs/my-first-post
```

####禁止在URL中使用“_”

```
目的是提高可读性，“_”可能被文本查看器中的下划线特效遮蔽
反例：http://api.example.com/blogs/my_first_post
```

####禁止使用大写字母

```
RFC 3986中规定URI区分大小写，但别用大写字母来为难程序员了，既不美观，又麻烦
正例：http://api.example.com/my-folder/my-doc 
反例：http://api.example.com/My-Folder/My-Doc 
```

####不要在URI中包含扩展名

```
应鼓励REST API客户端使用HTTP提供的格式选择机制Accept request header
正例：http://api.college.com/students/3248234/courses/2005/fall
反例：http://api.college.com/students/3248234/courses/2005/fall.json 
```

最后，给后端研发工程师一个建议：清晰优雅的 RESTful API是为调用者编写的，别无脑随意定义一些shit一样的URI给移动/前端工程师使用，小心生命有危险。



