(function(document) {
	'use strict';

	var LightTableSorter = (function(Arr) {

		var _th, _cellIndex, _order = '';

		function _text(row) {
			return row.cells.item(_cellIndex).textContent.toLowerCase();
		}

		function _sort(a, b) {
			var va = _text(a), vb = _text(b), n = parseInt(va, 10);
			if (n) {
				va = n;
				vb = parseInt(vb, 10);
			}
			return va > vb ? 1 : va < vb ? -1 : 0;
		}

		function _toggle() {
			var c = _order !== 'asc' ? 'asc' : 'desc';
			_th.className = (_th.className.replace(_order, '') + ' ' + c).trim();
			_order = c;
		}

		function _reset() {
			_th.className = _th.className.replace('asc', '').replace('desc', '');
			_order = '';
		}

		function onClickEvent(e) {
			if (_th && _cellIndex !== e.target.cellIndex) {
				_reset();
			}
			_th = e.target;
			_cellIndex = _th.cellIndex;
			var tbody = _th.offsetParent.getElementsByTagName('tbody')[0],
				rows = tbody.rows;
			if (rows) {
				rows = Arr.sort.call(Arr.slice.call(rows, 0), _sort);
				if (_order === 'asc') {
					Arr.reverse.call(rows);
				}
				_toggle();
				tbody.innerHtml = '';
				Arr.forEach.call(rows, function(row) { tbody.appendChild(row); });
			}
		}

		return {
			init: function() {
				var ths = document.getElementsByTagName('th');
				Arr.forEach.call(ths, function(th) { th.onclick = onClickEvent; });
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableSorter.init();
		}
	});

})(document);