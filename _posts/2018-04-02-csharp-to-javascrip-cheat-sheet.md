---
layout: post
title: "C# to JavaScrip cheat sheet"
date: 2018-04-02
categories: []
tags: []
assets: /assets/2018-csharp-to-javascrip-cheat-sheet
excerpt_separator: <!--more-->
---

This is an opinionated and incomplete Cheat Sheet for developers familiar with
C# who are learning JavaScript.

I have been working with JavaScript for the last year or so, and created this
Cheat Sheet in the process.

<!--more-->

## String.IsNullOrEmpty

C#:

```csharp
string.isNullOrEmpty(s);
```

JS:

```javascript
_.isEmpty(s);
```

[lodash:isEmpty](https://lodash.com/docs/4.17.4#isEmpty)

## String.IsNullOrWhitespace

C#:

```csharp
string.isNullOrWhitespace(s);
```

JS:

```javascript
_.isEmpty(_.trim(s);
```

[lodash:isEmpty](https://lodash.com/docs/4.17.4#isEmpty) [lodash:trim](https://lodash.com/docs/4.17.4#trim)

## LinQ Select

C#:

```csharp
var l = new List<int>{1,2,3};
l.Select(i => i * 2);
// => 2,4,6
```

JS:

```javascript
_.map([1, 2, 3], i => i * 2);
// => 2,4,6
```

[lodash:map](https://lodash.com/docs/4.17.4#map)

## LinQ Where

C#:

```csharp
var l = new List<int>{1,2,3};
l.Where(i => i % 2 != 0);
// => 1,3
```

JS:

```javascript
_.filter([1, 2, 3], i => i % 2 !== 0);
// => 1,3
```

[Lodash:filter](https://lodash.com/docs/4.17.4#filter)

## LinQ Any

C#:

```csharp
var l = new List<int>{1,2,3};
l.Any(i => i % 2 != 0);
// => true
```

JS:

```javascript
_.some([1, 2, 3], i => i % 2 !== 0);
// => true
```

[Lodash:some](https://lodash.com/docs/4.17.4#some)

## List<T> Contains

C#:

```csharp
var l = new List<int>{1,2,3};
l.Contains(2);
// => true
```

JS:

```javascript
_.has([1, 2, 3], 2);
// => true
```

[Lodash:has](https://lodash.com/docs/4.17.4#has)
