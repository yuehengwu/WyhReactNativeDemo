# React Native 


RN 这套框架让 JS开发者可以大部分使用JS代码就可以构建一个跨平台APP。 Facebook官方说法是`learn once, run everywhere`， 即在Android 、 IOS、 Browser各个平台，程序画UI和写逻辑的方式都大致相同。因为JS 可以动态加载，从而理论上可以做到`write once, run everywhere`

![](https://upload-images.jianshu.io/upload_images/4097230-0d46fc0a5fa4405e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

RN需要一个JS的运行环境， 在IOS上直接使用内置的javascriptcore， 在Android 则使用webkit.org官方开源的jsc.so。 此外还集成了其他开源组件，如fresco图片组件，okhttp网络组件等。

RN 会把应用的JS代码（包括依赖的framework）编译成一个js bundle文件（一般命名为index.android.bundle) , RN的整体框架目标就是为了解析运行这个js 脚本文件，如果是js 扩展的API， 则直接通过bridge调用native方法; 如果是UI界面， 则映射到**virtual DOM**这个虚拟的JS数据结构中，通过bridge 传递到native ， 然后根据数据属性设置各个对应的真实native的View。 

## What is Virtual Dom?

Web 的早期，这些页面通常是静态的，页面内容不会变化。而如果数据发生了变化，通常需要重新请求页面，得到基于新的数据渲染出的新的页面。
![早期](https://upload-images.jianshu.io/upload_images/4097230-d863fa1a4b3e43a1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![早期](https://upload-images.jianshu.io/upload_images/4097230-204e53be274d3aa2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


后来开发者们开发框架，监听数据的变更，在数据变更后更新对应的 DOM 节点。虽然还是要写一些代码，但是建立这种绑定关系的过程被框架所处理，开发者要写的代码变少了，而且代码更易读和维护了。

![image.png](https://upload-images.jianshu.io/upload_images/4097230-c72fb3622e1ad68d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

但这样做，每次数据发生变化时，都要去重新整体渲染一次DOM，用户体验不好。

而 Virtual DOM 就是在数据和真实 DOM 之间建立了一层缓冲。对于开发者而言，数据变化了就调用 React 的渲染方法，而 React 并不是直接得到新的 DOM 进行替换，而是先生成 Virtual DOM，与上一次渲染得到的 Virtual DOM 进行比对，在渲染得到的 Virtual DOM 上发现变化，然后将变化的地方更新到真实 DOM 上。

![RN](https://upload-images.jianshu.io/upload_images/4097230-4f433998b1c50718.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

初始渲染时，首先将数据渲染为 Virtual DOM，然后由 Virtual DOM 生成 DOM。

![image.png](https://upload-images.jianshu.io/upload_images/4097230-3cf72a2e674ec4fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

数据更新时，渲染得到新的 Virtual DOM，与上一次得到的 Virtual DOM 进行 `diff`，得到所有需要在 DOM 上进行的变更，然后在 patch 过程中应用到 DOM 上实现UI的同步更新。

所以RN在官网才可以这么说：
> ###Don't waste time recompiling
React Native lets you build your app faster. Instead of recompiling, you can reload your app instantly. With **Hot Reloading**, you can even run new code while retaining your application state. Give it a try - it's a magical experience.

## 将React Native集成到现有项目中

- 首先创建一个空目录用于存放React Native项目，然后在其中创建一个/ios子目录，把你现有的iOS项目拷贝到/ios子目录中。

- `touch package.json` 包文件声明

- `npm install` 安装必要的Module库

- `Pod RN` 根据需要进行对应pod

- 编写`js`文件，并在其中指定入口

- 在`OC`中对应入口，并将控制器view指定给`RN`的`rootView`

- `npm start` 开启服务器实时打包`js bundle`解析，并`run`程序

## React Native 生命周期

![image.png](https://upload-images.jianshu.io/upload_images/4097230-5117d2dadd0daa70.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
    
如图，可以把组件生命周期大致分为三个阶段：

- 第一阶段：是组件第一次绘制阶段，如图中的上面虚线框内，在这里完成了组件的加载和初始化；
- 第二阶段：是组件在运行和交互阶段，如图中左下角虚线框，这个阶段组件可以处理用户交互，或者接收事件更新界面；
- 第三阶段：是组件卸载消亡的阶段，如图中右下角的虚线框中，这里做一些组件的清理工作。

### componentWillMount
这个函数调用时机是在组件创建，并初始化了状态之后，在第一次绘制 render() 之前。可以在这里做一些业务初始化操作，也可以设置组件状态。这个函数在整个生命周期中只被调用一次。

### Render

`component` 真正开始渲染UI的方法

注意如果 `setState()` 在`render()`之后设置会导致页面重新渲染

### componentDidMount
在组件第一次绘制之后，会调用 componentDidMount()，通知组件已经加载完成。

这个函数调用的时候，其虚拟 DOM 已经构建完成，你可以在这个函数开始获取其中的元素或者子组件了。需要注意的是，RN 框架是先调用子组件的 componentDidMount()，然后调用父组件的函数。从这个函数开始，就可以和 JS 其他框架交互了，例如设置计时 setTimeout 或者 setInterval，或者发起网络请求。

同样这个函数也是只被调用一次。这个函数之后，就进入了稳定运行状态，等待事件触发。

### componentWillReceiveProps
如果组件收到新的属性（props），就会调用 componentWillReceiveProps() 

```java
void componentWillReceiveProps(  
  object nextProps
)
```
输入参数 nextProps 是即将被设置的属性，旧的属性还是可以通过 this.props 来获取。在这个回调函数里面，你可以根据属性的变化，通过调用 this.setState() 来更新你的组件状态，这里调用更新状态是安全的，并不会触发额外的 render() 调用

### shouldComponentUpdate
当组件接收到新的属性和状态改变的话，都会触发调用 shouldComponentUpdate()，函数原型如下：

```java
boolean shouldComponentUpdate(  
  object nextProps, object nextState
)
```

nextProps 和上面的 componentWillReceiveProps 函数一样，nextState 表示组件即将更新的状态值。

这个函数的返回值决定是否需要更新组件，如果 true 表示需要更新，继续走后面的更新流程。否者，则不更新，直接进入等待状态。

在实际项目中，你可以自己重载这个函数，通过检查变化前后属性和状态，来决定 UI 是否需要更新，能有效提高应用性能。

### componentWillUpdate

如果组件状态或者属性改变，并且上面的 shouldComponentUpdate() 返回为 true，就会开始准更新组件，并调用 componentWillUpdate()
  
在这个回调中，可以做一些在更新界面之前要做的事情。需要特别注意的是，在这个函数里面，你就不能使用 this.setState 来修改状态。这个函数调用之后，就会把 nextProps 和 nextState 分别设置到 this.props 和 this.state 中。紧接着这个函数，就会调用 render() 来更新界面了。

### componentDidUpdate

调用了 render() 更新完成界面之后，会调用 componentDidUpdate() 来得到通知

在这个函数中，可以做一些组件相关的清理工作，例如取消计时器、网络请求等。

### componentWillUnmount
组件DOM中移除的时候调用，在这里可以进行一些相关的销毁操作
，比如定时器、监听等

### componentDidCatch
如果页面render()时返回异常，或是我们手动throw一个error时，它的**父控件**会走这个回调方法，方法会将error的详细信息附带着

```java
void componentDidCatch(error,info) {

}
```
而异常的对象的生命周期会走componentWillUpdate->render->componentWillUnmount 

注意：如果需要对错误进行调试，我们大可以在componentDidCatch()中重新setState将errorInfo保存在state里，并重新加载页面将error信息show在UI上

好了，生命周期文字总结就到这了，具体我们来看源码


## React Native 与 OC 交互

即将开始！！





