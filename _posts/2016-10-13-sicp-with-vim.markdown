---
layout: post
title:  "Sicp with Vim"
date:   2016-10-13 
categories: jekyll update
---

#为学习SICP配置vim的scheme开发环境

在过去的几个月，我一直在啃《程序语言的构造与解释》（MIT关于计算机程序构造原则的经典教材。虽然这本书并不是那么通俗易懂，但是只要你花时间、下工夫，肯定会有所收获，当然如果你做完了所有习题，收获将是巨大的。我非常喜欢的是，在学习过一定数学知识，并且写过一定实际代码之后，本书很好的将二者联系了起来。

当然，有很多人说了SICP的种种好处，为什么你需要读它？以及它的习题是如何值得花时间完成的，都说得比我更具说服力。假设你现在已经开始你自己的SICP探索之旅，我希望我能够为一些Vim用户节约一些时间，讲一讲我如何配置我的编程环境让做习题变得更简单容易。你肯定用Vim吧？

简而言之，我要讲一讲如何获得SICP，使用何种Scheme解释器，如何通过tslime将一段代码从Vim发送到另外的tmux窗口上运行的REPL中。
这些方法在我使用的OS X 10.9.4上没有问题，同时我认为在Linux也同样可以(译者Debian 8 KDE 正确配置）。Windows用户就不得而知了。


##获取SICP

首先你要有一份SICP，非常幸运，这很易得。当然你也可以从Amazon或者[MIT出版社](https://mitpress.mit.edu/books/structure-and-interpretation-computer-programs)购买到纸质版。

另外，如果电子书更合你胃口，你可以从MIT出版社的[SICP页面](https://mitpress.mit.edu/sicp/)下载到全书。但是，我强烈
推荐Andres Raba发布的非官方的电子书版本，相较于原版电子书，它有更好的排版、更漂亮的字体以及精美的SVG插图。
你可以[下载](http://sicpebook.wordpress.com/ebook/)EPUB3和PDF格式的或者阅读在线的[HTML5版本](http://sarabander.github.io/sicp/)。

HTML5在线版本非常好用，我一直使用的这个版本，虽然我也有下载完整的离线版本，但却从来没有用过。

##选择一个Scheme实现（解释器）

为了汲取SICP的精华，你需要做它的习题，显然这需要一个Scheme解释器。Scheme是Lisp程序设计语言的一个方言，由Gerald Sussman与Guy Steele共同创造，同时Gerald Sussman也是SICP的作者之一。
对于Scheme解释器，你有非常多的选择：

###Racket
我在这里推荐安装[Racket](http://racket-lang.org/)，它安装方便，具有很好的有readline支持的[REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)，同时还有一个可以用于学习SICP的第三方扩展包。这个扩展包增加了像`inc`，`dec`这样的语法和`ture`， `false`， `nil`这样在书中提到的变量，但这都不默认包括在大多数的Scheme解释器实现中。当然自己去添加这些支持也不难，但不用去岂不是更好。

一旦你下载并安装完Racket，添加应用程序bin目录到你的路径，接下来可以用如下命令打开REPL：

`Racker –i –p –neil/sicp –l xrepl`

`-i` 打开交互模式。也就是说让Racket开始REPL同时等待输入。

`-p neil/sicp` 使用sicp的拓展包。如果没有默认安装，可以从Racket Plant package仓库进行下载。在我刚安装这个包并且使用时，出现了一个错误。

最后 `–l xrepl` 。打开racket的扩展REPL模式，这与默认模式相比它支持了readline。这意味着你可以查看命令历史，使用tab补全和emacs/bash风格的键位绑定。

如果racket不合你的口味，你同样有一些其它的选择，我将在下面简短介绍。

###Petite Chez Scheme

[Petite Chez Scheme](http://www.scheme.com/petitechezscheme.html)是另外一个学习SICP的好选择，它效率非常高，同Racket一样易于安装。同时在REPL中也有很好的readline支持。在许多方面它的REPL更好，例如它有更好的缩进和匹配括号的高亮，唯一一件令我困扰的是，在历史命令查看中，它对多行表达式的处理方式：按下导航键上一次，查看表达式的第一行，但是你再按一次，他就显示这个表达式的所有行。可能这可以通过`.inputrc`进行配置，但是我至今还未发现正确的配置选项。如果你由于某种原因没有使用Racket，Petite Chez Scheme是另外一个很好的选择。
###其他
[Mit scheme](http://www.gnu.org/software/mit-scheme/) 是我第一个尝试的解释器。我发现它可能是做SICP习题最好的选择。我相信它是Abelman和Sussman在他们的课程中所使用的解释器。尽管如此，它没什么错误，但也没多少人推荐。同时，在我使用的homebrew仓库中的版本中。没有我想要的readline支持来编译代码，所以我立马转向了其它的解释器。
我同样尝试了[chicken scheme](http://www.call-cc.org/)和[GNU Guile](http://www.gnu.org/software/guile/)，但同样的，我并没有发现与Racket相比，它们有何突出之处。并不是我认为它们不好，也许它们的好与不好超出了我使用Scheme的经验之外。在我的关注点上，作为SICP开始的初学者，我觉得Racket是最易上手的选择，且运行高效。

##Tmux

##配置vim

Vim初始配置下就对Scheme有非常好的支持。支持高亮，有着还不错的缩进，并不算太差也不完美。在一些边界情况下默认缩进会出现问题，不能正确按照约定的方式来正确缩进Lisp代码中的某一行。Dorai Sitaram 有一篇非常好的[文章](http://www.ccs.neu.edu/home/dorai/scmindent/index.html)来讲这个问题，并且给出了一个很好的解决方案。
他提供了一个简短的Racket脚本，[scmindent.rk](thttp://www.ccs.neu.edu/home/dorai/scmindent/scmindent.rkt)，扩展Vim默认的缩进使得其能够更好的缩进Scheme代码。

将这个脚本下载到你自己的目录（这里我下载到`~/bin`），然后在你的`.vimrc`中添加如下内容：

`autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt`

这个脚本可以通过你的home目录下的`.lispwords`来进行配置。为了使*if*条件语句的*then*和*else*缩进一致，我添加`(3 if)`到这个文件中。


###括号匹配和高亮

毫无疑问，Scheme编程中包含了大量的括号。除非你非常小心，否则很容易搞不清楚哪两个括号是相互匹配的。正确的缩进可以帮助你更好的编写代码，同时有许多Vim的插件可以让编写Scheme代码变得更容易。

第一个插件是rainbow parentheses plugin，它让一对括号（小括号，中括号和大括号）具有同样的颜色，使得我们可以很容易的看出哪些括号是一对。这个插件有许多版本（实际上功能差不多），在这里我使用的是[vim-niji](https://github.com/amdt/vim-niji)。虽然它默认配置就很好用，为了使得括号匹配显示得更明显，我将它的默认颜色匹配颜色改为了更易识别的颜色（高亮色）。你可以在
`.vimrc`中添加如下代码来实现：

let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]¬

第二个插件是[paredit.vim](https://github.com/vim-scripts/paredit.vim)，它可以自动将一些字符补全（小括号，中括号，引用等）。让你输输入`(`，的时候，这个插件会自动的为你添加一个与之对应的`)`,同时光标也是在这一对匹配括号之间，以便于你的后续输入。这明显的提高了Scheme初学者的效率。

开始的时候你也许会觉得有些奇怪，它
You might find it a little strange at first because it prevents you from deleting characters that would unbalance an expression, but in a way, this is Paredit’s core feature in disguise. Paredit recognises the nested list structure of Scheme (and other Lisp-ish) programs, and allows you to manipulate that structure directly rather than treating it as freeform text. For example, you can join adjacent lists, or splice the contents of a list into a parent list. It’s powerful, but you don’t need to understand all of the features to make use of it straight away, and the documentation is good when you’re ready to learn more.

###Tslime

最后一个插件就是[tslime](https://github.com/sjl/tslime.vim)，一个简单聪明的插件，可以让你从Vim缓冲区发送一段文本到其它的tmux面板。有了它你在Vim中编写Scheme代码将变得非常方便，你可以快速的选择一段代码将其发送到其它窗口运行的REPL中。拿我来说，我就喜欢开着两个相邻的面板，一边打开Vim，另外一边打开REPL。我这样可以最好的及时获取这段代码的反馈，它可以使你保持专注而不是频繁切换窗口进行调试。方式灵活多变，你也可以使用任何你喜欢的tmux配置，同时它也支持非终端的Vim，例如GVim和MacVim。

同样这个插件也有许多版本，我个人推荐使用[Steve Losh的修改版](https://github.com/sjl/tslime.vim)，它有非常好的特性并且有至今为止最好的文档。默认状态下，它在Vim的normal模式和visual模式下发送文本到一个tmux面板，我将这个操作绑定到了`<localleader>t`，在我的电脑上就是`\t`。使用`ctrl-c`（默认快捷键）常常杀掉shell程序，这让我感觉怪怪的。无论你使用什么快捷键，当你在一个session中第一次使用tslime的时候，会提示让你绑定一个tmux session的某个窗口中的某一个面板。你可以在提示的时候按tab来显示所有可选的目标。

在visual模式下，tslime发送你当前所选的文本到绑定的tmux面板中。在Normal模式中，它发送的则是当前段落i.e. the contents of vip。当使用带有REPL的tslime时，你通常需要在.`vimrc`中添加`g:tslime_ensure_trailing_newlines = 1`来确保至少在发送文本末尾有一个换行符，如果不这样，代码也会正常发送到REPL，但是并不会立即执行，除非你切换到REPL面板，然后按下回车键（手动输入换行符）。

作为参考，这是我`.vimrc`配置文件中tslime的部分：
" tslime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'
" }}}

##将它们结合起来

如何将它们结合起来？下图是将它们结合起来使用的一个简单例子：

- 在终端中打开tmux，将窗口分为两个面板。
- 在右边的面板中运行Racket REPL，然后在左边打开Vim。
- 写一个简单的阶乘函数（注意我们使用的Niji和Parendit插件）。
- 将代码用scmindet.rkt重新格式化。
- 使用tslime发送代码到REPL，使用tab补全可选项并且选择session，窗口和面板。
- 最后调用这个函数来确保已经正常工作。

总结

全文就是这样了。我希望这篇文章会对正在或者将要学习SICP的人有所帮助。如果您对我的文章有任何问题或者建议，你可以给我发邮件或者在Twitter上联系我，我将非常乐意收到你的来信。
