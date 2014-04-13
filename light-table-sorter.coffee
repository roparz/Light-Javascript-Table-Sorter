LightTableSorter = do ->

    _th = null
    _cellIndex = null
    _order = ''

    _text = (row) ->
        return row.cells.item(_cellIndex).textContent.toLowerCase()

    _sort = (a, b) ->
        textA = _text(a)
        textB = _text(b)
        n = parseInt(textA, 10)
        if n
            textA = n
            textB = parseInt(textB, 10)
        if textA > textB then return 1
        if textA < textB then return -1
        return 0

    _toggle = ->
        c = if _order isnt 'asc' then 'asc' else 'desc'
        _th.className = (_th.className.replace(_order, '') + ' ' + c).trim()
        _order = c

    _reset = ->
        _th.className = _th.className.replace('asc', '').replace('desc', '')
        _order = ''

    _onClickEvent = (e) ->
        _reset() if _th and (_cellIndex isnt e.target.cellIndex)
        _th = e.target
        if _th.nodeName.toLowerCase() is 'th'
            _cellIndex = _th.cellIndex
            tbody = _th.offsetParent.getElementsByTagName('tbody')[0]
            rows = tbody.rows
            if rows
                rows = Array.prototype.slice.call(rows, 0)
                rows = Array.prototype.sort.call(rows, _sort)
                Array.prototype.reverse.call(rows) if _order is 'asc'
                _toggle()
                tbody.innerHtml = ''
                tbody.appendChild(row) for row in rows
        return


    return init: ->
        ths = document.getElementsByTagName('th')
        th.onclick = _onClickEvent for th in ths

