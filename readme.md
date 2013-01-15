# Lightweight javascript table sorter

Made for an internal tool, I didn't try to make it crossbrowser.

You don't need any library to use it. It's just javascript.

Here is a simple implementation [demo](http://roparz.me/light-table-sorter/) and here is a [playground](http://cssdeck.com/labs/light-javascript-table-sorter).

## How to use it?

Installation is very simple. Just add the script in your html (head or foot, whatever):
```html
<script src="light-table-sorter.js"></script>
```

Or the minified version:
```html
<script src="light-table-sorter.min.js"></script>
```

You just need to respect this table structure:
```html
<table>
    <thead>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>...</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>John</td>
            <td>Snow</td>
            <td>...</td>
        </tr>
        <tr>...</tr>
    </tbody>
</table>
```

## Classes and style

Some classes are added when you click on a `th` element. `asc` for ascending sorting and `desc` for descendant sorting.

You can style your table the way you want. You also can take inspiration from [my own](http://roparz.me/light-table-sorter/style.css) ;-)

**That's all folks!**
