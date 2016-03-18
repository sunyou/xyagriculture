(function ($) {
    var apiParams = { set: { colors: 1, values: 1, backgroundColor: 1, scaleColors: 1, normalizeFunction: 1, focus: 1 }, get: { selectedRegions: 1, selectedMarkers: 1, mapObject: 1, regionName: 1 } }; $.fn.vectorMap = function (options) {
        var map, methodName, event, map = this.children('.jvectormap-container').data('mapObject'); if (options === 'addMap') { jvm.WorldMap.maps[arguments[1]] = arguments[2]; } else if ((options === 'set' || options === 'get') && apiParams[options][arguments[1]]) { methodName = arguments[1].charAt(0).toUpperCase() + arguments[1].substr(1); return map[options + methodName].apply(map, Array.prototype.slice.call(arguments, 2)); } else { options = options || {}; options.container = this; map = new jvm.WorldMap(options); }
        return this;
    };
})(jQuery); (function ($) {
    var types = ['DOMMouseScroll', 'mousewheel']; if ($.event.fixHooks) { for (var i = types.length; i;) { $.event.fixHooks[types[--i]] = $.event.mouseHooks; } }
    $.event.special.mousewheel = { setup: function () { if (this.addEventListener) { for (var i = types.length; i;) { this.addEventListener(types[--i], handler, false); } } else { this.onmousewheel = handler; } }, teardown: function () { if (this.removeEventListener) { for (var i = types.length; i;) { this.removeEventListener(types[--i], handler, false); } } else { this.onmousewheel = null; } } }; $.fn.extend({ mousewheel: function (fn) { return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel"); }, unmousewheel: function (fn) { return this.unbind("mousewheel", fn); } }); function handler(event) {
        var orgEvent = event || window.event, args = [].slice.call(arguments, 1), delta = 0, returnValue = true, deltaX = 0, deltaY = 0; event = $.event.fix(orgEvent); event.type = "mousewheel"; if (orgEvent.wheelDelta) { delta = orgEvent.wheelDelta / 120; }
        if (orgEvent.detail) { delta = -orgEvent.detail / 3; }
        deltaY = delta; if (orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS) { deltaY = 0; deltaX = -1 * delta; }
        if (orgEvent.wheelDeltaY !== undefined) { deltaY = orgEvent.wheelDeltaY / 120; }
        if (orgEvent.wheelDeltaX !== undefined) { deltaX = -1 * orgEvent.wheelDeltaX / 120; }
        args.unshift(event, delta, deltaX, deltaY); return ($.event.dispatch || $.event.handle).apply(this, args);
    }
})(jQuery); var jvm = {
    inherits: function (child, parent) {
        function temp() { }
        temp.prototype = parent.prototype; child.prototype = new temp(); child.prototype.constructor = child; child.parentClass = parent;
    }, mixin: function (target, source) { var prop; for (prop in source.prototype) { if (source.prototype.hasOwnProperty(prop)) { target.prototype[prop] = source.prototype[prop]; } } }, min: function (values) {
        var min = Number.MAX_VALUE, i; if (values instanceof Array) { for (i = 0; i < values.length; i++) { if (values[i] < min) { min = values[i]; } } } else { for (i in values) { if (values[i] < min) { min = values[i]; } } }
        return min;
    }, max: function (values) {
        var max = Number.MIN_VALUE, i; if (values instanceof Array) { for (i = 0; i < values.length; i++) { if (values[i] > max) { max = values[i]; } } } else { for (i in values) { if (values[i] > max) { max = values[i]; } } }
        return max;
    }, keys: function (object) {
        var keys = [], key; for (key in object) { keys.push(key); }
        return keys;
    }, values: function (object) {
        var values = [], key, i; for (i = 0; i < arguments.length; i++) { object = arguments[i]; for (key in object) { values.push(object[key]); } }
        return values;
    }
}; jvm.$ = jQuery; jvm.AbstractElement = function (name, config) { this.node = this.createElement(name); this.name = name; this.properties = {}; if (config) { this.set(config); } }; jvm.AbstractElement.prototype.set = function (property, value) { var key; if (typeof property === 'object') { for (key in property) { this.properties[key] = property[key]; this.applyAttr(key, property[key]); } } else { this.properties[property] = value; this.applyAttr(property, value); } }; jvm.AbstractElement.prototype.get = function (property) { return this.properties[property]; }; jvm.AbstractElement.prototype.applyAttr = function (property, value) { this.node.setAttribute(property, value); }; jvm.AbstractElement.prototype.remove = function () { jvm.$(this.node).remove(); }; jvm.AbstractCanvasElement = function (container, width, height) { this.container = container; this.setSize(width, height); this.rootElement = new jvm[this.classPrefix + 'GroupElement'](); this.node.appendChild(this.rootElement.node); this.container.appendChild(this.node); }
jvm.AbstractCanvasElement.prototype.add = function (element, group) { group = group || this.rootElement; group.add(element); element.canvas = this; }
jvm.AbstractCanvasElement.prototype.addPath = function (config, style, group) { var el = new jvm[this.classPrefix + 'PathElement'](config, style); this.add(el, group); return el; }; jvm.AbstractCanvasElement.prototype.addCircle = function (config, style, group) { var el = new jvm[this.classPrefix + 'CircleElement'](config, style); this.add(el, group); return el; }; jvm.AbstractCanvasElement.prototype.addGroup = function (parentGroup) {
    var el = new jvm[this.classPrefix + 'GroupElement'](); if (parentGroup) { parentGroup.node.appendChild(el.node); } else { this.node.appendChild(el.node); }
    el.canvas = this; return el;
}; jvm.AbstractShapeElement = function (name, config, style) { this.style = style || {}; this.style.current = {}; this.isHovered = false; this.isSelected = false; this.updateStyle(); }; jvm.AbstractShapeElement.prototype.setHovered = function (isHovered) { if (this.isHovered !== isHovered) { this.isHovered = isHovered; this.updateStyle(); } }; jvm.AbstractShapeElement.prototype.setSelected = function (isSelected) { if (this.isSelected !== isSelected) { this.isSelected = isSelected; this.updateStyle(); jvm.$(this.node).trigger('selected', [isSelected]); } }; jvm.AbstractShapeElement.prototype.setStyle = function (property, value) {
    var styles = {}; if (typeof property === 'object') { styles = property; } else { styles[property] = value; }
    jvm.$.extend(this.style.current, styles); this.updateStyle();
}; jvm.AbstractShapeElement.prototype.updateStyle = function () {
    var attrs = {}; jvm.AbstractShapeElement.mergeStyles(attrs, this.style.initial); jvm.AbstractShapeElement.mergeStyles(attrs, this.style.current); if (this.isHovered) { jvm.AbstractShapeElement.mergeStyles(attrs, this.style.hover); }
    if (this.isSelected) { jvm.AbstractShapeElement.mergeStyles(attrs, this.style.selected); if (this.isHovered) { jvm.AbstractShapeElement.mergeStyles(attrs, this.style.selectedHover); } }
    this.set(attrs);
}; jvm.AbstractShapeElement.mergeStyles = function (styles, newStyles) { var key; newStyles = newStyles || {}; for (key in newStyles) { if (newStyles[key] === null) { delete styles[key]; } else { styles[key] = newStyles[key]; } } }; jvm.SVGElement = function (name, config) { jvm.SVGElement.parentClass.apply(this, arguments); }
jvm.inherits(jvm.SVGElement, jvm.AbstractElement); jvm.SVGElement.svgns = "http://www.w3.org/2000/svg"; jvm.SVGElement.prototype.createElement = function (tagName) { return document.createElementNS(jvm.SVGElement.svgns, tagName); }; jvm.SVGElement.prototype.addClass = function (className) { this.node.setAttribute('class', className); }; jvm.SVGElement.prototype.getElementCtr = function (ctr) { return jvm['SVG' + ctr]; }; jvm.SVGElement.prototype.getBBox = function () { return this.node.getBBox(); }; jvm.SVGGroupElement = function () { jvm.SVGGroupElement.parentClass.call(this, 'g'); }; jvm.inherits(jvm.SVGGroupElement, jvm.SVGElement); jvm.SVGGroupElement.prototype.add = function (element) { this.node.appendChild(element.node); }; jvm.SVGCanvasElement = function (container, width, height) { this.classPrefix = 'SVG'; jvm.SVGCanvasElement.parentClass.call(this, 'svg'); jvm.AbstractCanvasElement.apply(this, arguments); }; jvm.inherits(jvm.SVGCanvasElement, jvm.SVGElement); jvm.mixin(jvm.SVGCanvasElement, jvm.AbstractCanvasElement); jvm.SVGCanvasElement.prototype.setSize = function (width, height) { this.width = width; this.height = height; this.node.setAttribute('width', width); this.node.setAttribute('height', height); }; jvm.SVGCanvasElement.prototype.applyTransformParams = function (scale, transX, transY) { this.scale = scale; this.transX = transX; this.transY = transY; this.rootElement.node.setAttribute('transform', 'scale(' + scale + ') translate(' + transX + ', ' + transY + ')'); }; jvm.SVGShapeElement = function (name, config, style) { jvm.SVGShapeElement.parentClass.call(this, name, config); jvm.AbstractShapeElement.apply(this, arguments); }; jvm.inherits(jvm.SVGShapeElement, jvm.SVGElement); jvm.mixin(jvm.SVGShapeElement, jvm.AbstractShapeElement); jvm.SVGPathElement = function (config, style) { jvm.SVGPathElement.parentClass.call(this, 'path', config, style); this.node.setAttribute('fill-rule', 'evenodd'); }; jvm.inherits(jvm.SVGPathElement, jvm.SVGShapeElement); jvm.SVGCircleElement = function (config, style) { jvm.SVGCircleElement.parentClass.call(this, 'circle', config, style); }; jvm.inherits(jvm.SVGCircleElement, jvm.SVGShapeElement); jvm.VMLElement = function (name, config) {
    if (!jvm.VMLElement.VMLInitialized) { jvm.VMLElement.initializeVML(); }
    jvm.VMLElement.parentClass.apply(this, arguments);
}; jvm.inherits(jvm.VMLElement, jvm.AbstractElement); jvm.VMLElement.VMLInitialized = false; jvm.VMLElement.initializeVML = function () {
    try {
        if (!document.namespaces.rvml) { document.namespaces.add("rvml", "urn:schemas-microsoft-com:vml"); }
        jvm.VMLElement.prototype.createElement = function (tagName) { return document.createElement('<rvml:' + tagName + ' class="rvml">'); };
    } catch (e) { jvm.VMLElement.prototype.createElement = function (tagName) { return document.createElement('<' + tagName + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">'); }; }
    document.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)"); jvm.VMLElement.VMLInitialized = true;
}; jvm.VMLElement.prototype.getElementCtr = function (ctr) { return jvm['VML' + ctr]; }; jvm.VMLElement.prototype.addClass = function (className) { jvm.$(this.node).addClass(className); }; jvm.VMLElement.prototype.applyAttr = function (attr, value) { this.node[attr] = value; }; jvm.VMLElement.prototype.getBBox = function () { var node = jvm.$(this.node); return { x: node.position().left / this.canvas.scale, y: node.position().top / this.canvas.scale, width: node.width() / this.canvas.scale, height: node.height() / this.canvas.scale }; }; jvm.VMLGroupElement = function () { jvm.VMLGroupElement.parentClass.call(this, 'group'); this.node.style.left = '0px'; this.node.style.top = '0px'; this.node.coordorigin = "0 0"; }; jvm.inherits(jvm.VMLGroupElement, jvm.VMLElement); jvm.VMLGroupElement.prototype.add = function (element) { this.node.appendChild(element.node); }; jvm.VMLCanvasElement = function (container, width, height) { this.classPrefix = 'VML'; jvm.VMLCanvasElement.parentClass.call(this, 'group'); jvm.AbstractCanvasElement.apply(this, arguments); this.node.style.position = 'absolute'; }; jvm.inherits(jvm.VMLCanvasElement, jvm.VMLElement); jvm.mixin(jvm.VMLCanvasElement, jvm.AbstractCanvasElement); jvm.VMLCanvasElement.prototype.setSize = function (width, height) {
    var paths, groups, i, l; this.width = width; this.height = height; this.node.style.width = width + "px"; this.node.style.height = height + "px"; this.node.coordsize = width + ' ' + height; this.node.coordorigin = "0 0"; if (this.rootElement) {
        paths = this.rootElement.node.getElementsByTagName('shape'); for (i = 0, l = paths.length; i < l; i++) { paths[i].coordsize = width + ' ' + height; paths[i].style.width = width + 'px'; paths[i].style.height = height + 'px'; }
        groups = this.node.getElementsByTagName('group'); for (i = 0, l = groups.length; i < l; i++) { groups[i].coordsize = width + ' ' + height; groups[i].style.width = width + 'px'; groups[i].style.height = height + 'px'; }
    }
}; jvm.VMLCanvasElement.prototype.applyTransformParams = function (scale, transX, transY) { this.scale = scale; this.transX = transX; this.transY = transY; this.rootElement.node.coordorigin = (this.width - transX - this.width / 100) + ',' + (this.height - transY - this.height / 100); this.rootElement.node.coordsize = this.width / scale + ',' + this.height / scale; }; jvm.VMLShapeElement = function (name, config) { jvm.VMLShapeElement.parentClass.call(this, name, config); this.fillElement = new jvm.VMLElement('fill'); this.strokeElement = new jvm.VMLElement('stroke'); this.node.appendChild(this.fillElement.node); this.node.appendChild(this.strokeElement.node); this.node.stroked = false; jvm.AbstractShapeElement.apply(this, arguments); }; jvm.inherits(jvm.VMLShapeElement, jvm.VMLElement); jvm.mixin(jvm.VMLShapeElement, jvm.AbstractShapeElement); jvm.VMLShapeElement.prototype.applyAttr = function (attr, value) {
    switch (attr) {
        case 'fill': this.node.fillcolor = value; break; case 'fill-opacity': this.fillElement.node.opacity = Math.round(value * 100) + '%'; break; case 'stroke': if (value === 'none') { this.node.stroked = false; } else { this.node.stroked = true; }
            this.node.strokecolor = value; break; case 'stroke-opacity': this.strokeElement.node.opacity = Math.round(value * 100) + '%'; break; case 'stroke-width': if (parseInt(value, 10) === 0) { this.node.stroked = false; } else { this.node.stroked = true; }
                this.node.strokeweight = value; break; case 'd': this.node.path = jvm.VMLPathElement.pathSvgToVml(value); break; default: jvm.VMLShapeElement.parentClass.prototype.applyAttr.apply(this, arguments);
    }
}; jvm.VMLPathElement = function (config, style) { var scale = new jvm.VMLElement('skew'); jvm.VMLPathElement.parentClass.call(this, 'shape', config, style); this.node.coordorigin = "0 0"; scale.node.on = true; scale.node.matrix = '0.01,0,0,0.01,0,0'; scale.node.offset = '0,0'; this.node.appendChild(scale.node); }; jvm.inherits(jvm.VMLPathElement, jvm.VMLShapeElement); jvm.VMLPathElement.prototype.applyAttr = function (attr, value) { if (attr === 'd') { this.node.path = jvm.VMLPathElement.pathSvgToVml(value); } else { jvm.VMLShapeElement.prototype.applyAttr.call(this, attr, value); } }; jvm.VMLPathElement.pathSvgToVml = function (path) {
    var result = '', cx = 0, cy = 0, ctrlx, ctrly; path = path.replace(/(-?\d+)e(-?\d+)/g, '0'); return path.replace(/([MmLlHhVvCcSs])\s*((?:-?\d*(?:\.\d+)?\s*,?\s*)+)/g, function (segment, letter, coords, index) {
        coords = coords.replace(/(\d)-/g, '$1,-').replace(/^\s+/g, '').replace(/\s+$/g, '').replace(/\s+/g, ',').split(','); if (!coords[0]) coords.shift(); for (var i = 0, l = coords.length; i < l; i++) { coords[i] = Math.round(100 * coords[i]); }
        switch (letter) { case 'm': cx += coords[0]; cy += coords[1]; return 't' + coords.join(','); break; case 'M': cx = coords[0]; cy = coords[1]; return 'm' + coords.join(','); break; case 'l': cx += coords[0]; cy += coords[1]; return 'r' + coords.join(','); break; case 'L': cx = coords[0]; cy = coords[1]; return 'l' + coords.join(','); break; case 'h': cx += coords[0]; return 'r' + coords[0] + ',0'; break; case 'H': cx = coords[0]; return 'l' + cx + ',' + cy; break; case 'v': cy += coords[0]; return 'r0,' + coords[0]; break; case 'V': cy = coords[0]; return 'l' + cx + ',' + cy; break; case 'c': ctrlx = cx + coords[coords.length - 4]; ctrly = cy + coords[coords.length - 3]; cx += coords[coords.length - 2]; cy += coords[coords.length - 1]; return 'v' + coords.join(','); break; case 'C': ctrlx = coords[coords.length - 4]; ctrly = coords[coords.length - 3]; cx = coords[coords.length - 2]; cy = coords[coords.length - 1]; return 'c' + coords.join(','); break; case 's': coords.unshift(cy - ctrly); coords.unshift(cx - ctrlx); ctrlx = cx + coords[coords.length - 4]; ctrly = cy + coords[coords.length - 3]; cx += coords[coords.length - 2]; cy += coords[coords.length - 1]; return 'v' + coords.join(','); break; case 'S': coords.unshift(cy + cy - ctrly); coords.unshift(cx + cx - ctrlx); ctrlx = coords[coords.length - 4]; ctrly = coords[coords.length - 3]; cx = coords[coords.length - 2]; cy = coords[coords.length - 1]; return 'c' + coords.join(','); break; }
        return '';
    }).replace(/z/g, 'e');
}; jvm.VMLCircleElement = function (config, style) { jvm.VMLCircleElement.parentClass.call(this, 'oval', config, style); }; jvm.inherits(jvm.VMLCircleElement, jvm.VMLShapeElement); jvm.VMLCircleElement.prototype.applyAttr = function (attr, value) { switch (attr) { case 'r': this.node.style.width = value * 2 + 'px'; this.node.style.height = value * 2 + 'px'; this.applyAttr('cx', this.get('cx') || 0); this.applyAttr('cy', this.get('cy') || 0); break; case 'cx': if (!value) return; this.node.style.left = value - (this.get('r') || 0) + 'px'; break; case 'cy': if (!value) return; this.node.style.top = value - (this.get('r') || 0) + 'px'; break; default: jvm.VMLCircleElement.parentClass.prototype.applyAttr.call(this, attr, value); } }; jvm.VectorCanvas = function (container, width, height) {
    this.mode = window.SVGAngle ? 'svg' : 'vml'; if (this.mode == 'svg') { this.impl = new jvm.SVGCanvasElement(container, width, height); } else { this.impl = new jvm.VMLCanvasElement(container, width, height); }
    return this.impl;
}; jvm.SimpleScale = function (scale) { this.scale = scale; }; jvm.SimpleScale.prototype.getValue = function (value) { return value; }; jvm.NumericScale = function (scale, normalizeFunction, minValue, maxValue) { this.scale = []; normalizeFunction = normalizeFunction || 'linear'; if (scale) this.setScale(scale); if (normalizeFunction) this.setNormalizeFunction(normalizeFunction); if (minValue) this.setMin(minValue); if (maxValue) this.setMax(maxValue); }; jvm.NumericScale.prototype = {
    setMin: function (min) { this.clearMinValue = min; if (typeof this.normalize === 'function') { this.minValue = this.normalize(min); } else { this.minValue = min; } }, setMax: function (max) { this.clearMaxValue = max; if (typeof this.normalize === 'function') { this.maxValue = this.normalize(max); } else { this.maxValue = max; } }, setScale: function (scale) { var i; for (i = 0; i < scale.length; i++) { this.scale[i] = [scale[i]]; } }, setNormalizeFunction: function (f) {
        if (f === 'polynomial') { this.normalize = function (value) { return Math.pow(value, 0.2); } } else if (f === 'linear') { delete this.normalize; } else { this.normalize = f; }
        this.setMin(this.clearMinValue); this.setMax(this.clearMaxValue);
    }, getValue: function (value) {
        var lengthes = [], fullLength = 0, l, i = 0, c; if (typeof this.normalize === 'function') { value = this.normalize(value); }
        for (i = 0; i < this.scale.length - 1; i++) { l = this.vectorLength(this.vectorSubtract(this.scale[i + 1], this.scale[i])); lengthes.push(l); fullLength += l; }
        c = (this.maxValue - this.minValue) / fullLength; for (i = 0; i < lengthes.length; i++) { lengthes[i] *= c; }
        i = 0; value -= this.minValue; while (value - lengthes[i] >= 0) { value -= lengthes[i]; i++; }
        if (i == this.scale.length - 1) { value = this.vectorToNum(this.scale[i]) } else { value = (this.vectorToNum(this.vectorAdd(this.scale[i], this.vectorMult(this.vectorSubtract(this.scale[i + 1], this.scale[i]), (value) / (lengthes[i]))))); }
        return value;
    }, vectorToNum: function (vector) {
        var num = 0, i; for (i = 0; i < vector.length; i++) { num += Math.round(vector[i]) * Math.pow(256, vector.length - i - 1); }
        return num;
    }, vectorSubtract: function (vector1, vector2) {
        var vector = [], i; for (i = 0; i < vector1.length; i++) { vector[i] = vector1[i] - vector2[i]; }
        return vector;
    }, vectorAdd: function (vector1, vector2) {
        var vector = [], i; for (i = 0; i < vector1.length; i++) { vector[i] = vector1[i] + vector2[i]; }
        return vector;
    }, vectorMult: function (vector, num) {
        var result = [], i; for (i = 0; i < vector.length; i++) { result[i] = vector[i] * num; }
        return result;
    }, vectorLength: function (vector) {
        var result = 0, i; for (i = 0; i < vector.length; i++) { result += vector[i] * vector[i]; }
        return Math.sqrt(result);
    }
}; jvm.OrdinalScale = function (scale) { this.scale = scale; }; jvm.OrdinalScale.prototype.getValue = function (value) { return this.scale[value]; }; jvm.ColorScale = function (colors, normalizeFunction, minValue, maxValue) { jvm.ColorScale.parentClass.apply(this, arguments); }; jvm.inherits(jvm.ColorScale, jvm.NumericScale); jvm.ColorScale.prototype.setScale = function (scale) { var i; for (i = 0; i < scale.length; i++) { this.scale[i] = jvm.ColorScale.rgbToArray(scale[i]); } }; jvm.ColorScale.prototype.getValue = function (value) { return jvm.ColorScale.numToRgb(jvm.ColorScale.parentClass.prototype.getValue.call(this, value)); }; jvm.ColorScale.arrayToRgb = function (ar) {
    var rgb = '#', d, i; for (i = 0; i < ar.length; i++) { d = ar[i].toString(16); rgb += d.length == 1 ? '0' + d : d; }
    return rgb;
}; jvm.ColorScale.numToRgb = function (num) {
    num = num.toString(16); while (num.length < 6) { num = '0' + num; }
    return '#' + num;
}; jvm.ColorScale.rgbToArray = function (rgb) { rgb = rgb.substr(1); return [parseInt(rgb.substr(0, 2), 16), parseInt(rgb.substr(2, 2), 16), parseInt(rgb.substr(4, 2), 16)]; }; jvm.DataSeries = function (params, elements) {
    var scaleConstructor; params = params || {}; params.attribute = params.attribute || 'fill'; this.elements = elements; this.params = params; if (params.attributes) { this.setAttributes(params.attributes); }
    if (jvm.$.isArray(params.scale)) { scaleConstructor = (params.attribute === 'fill' || params.attribute === 'stroke') ? jvm.ColorScale : jvm.NumericScale; this.scale = new scaleConstructor(params.scale, params.normalizeFunction, params.min, params.max); } else if (params.scale) { this.scale = new jvm.OrdinalScale(params.scale); } else { this.scale = new jvm.SimpleScale(params.scale); }
    this.values = params.values || {}; this.setValues(this.values);
}; jvm.DataSeries.prototype = {
    setAttributes: function (key, attr) { var attrs = key, code; if (typeof key == 'string') { if (this.elements[key]) { this.elements[key].setStyle(this.params.attribute, attr); } } else { for (code in attrs) { if (this.elements[code]) { this.elements[code].element.setStyle(this.params.attribute, attrs[code]); } } } }, setValues: function (values) {
        var max = Number.MIN_VALUE, min = Number.MAX_VALUE, val, cc, attrs = {}; if (!(this.scale instanceof jvm.OrdinalScale) && !(this.scale instanceof jvm.SimpleScale)) {
            if (!this.params.min || !this.params.max) {
                for (cc in values) { val = parseFloat(values[cc]); if (val > max) max = values[cc]; if (val < min) min = val; }
                if (!this.params.min) { this.scale.setMin(min); }
                if (!this.params.max) { this.scale.setMax(max); }
                this.params.min = min; this.params.max = max;
            }
            for (cc in values) { val = parseFloat(values[cc]); if (!isNaN(val)) { attrs[cc] = this.scale.getValue(val); } else { attrs[cc] = this.elements[cc].element.style.initial[this.params.attribute]; } }
        } else { for (cc in values) { if (values[cc]) { attrs[cc] = this.scale.getValue(values[cc]); } else { attrs[cc] = this.elements[cc].element.style.initial[this.params.attribute]; } } }
        this.setAttributes(attrs); jvm.$.extend(this.values, values);
    }, clear: function () {
        var key, attrs = {}; for (key in this.values) { if (this.elements[key]) { attrs[key] = this.elements[key].element.style.initial[this.params.attribute]; } }
        this.setAttributes(attrs); this.values = {};
    }, setScale: function (scale) { this.scale.setScale(scale); if (this.values) { this.setValues(this.values); } }, setNormalizeFunction: function (f) { this.scale.setNormalizeFunction(f); if (this.values) { this.setValues(this.values); } }
}; jvm.Proj = { degRad: 180 / Math.PI, radDeg: Math.PI / 180, radius: 6381372, sgn: function (n) { if (n > 0) { return 1; } else if (n < 0) { return -1; } else { return n; } }, mill: function (lat, lng, c) { return { x: this.radius * (lng - c) * this.radDeg, y: -this.radius * Math.log(Math.tan((45 + 0.4 * lat) * this.radDeg)) / 0.8 }; }, mill_inv: function (x, y, c) { return { lat: (2.5 * Math.atan(Math.exp(0.8 * y / this.radius)) - 5 * Math.PI / 8) * this.degRad, lng: (c * this.radDeg + x / this.radius) * this.degRad }; }, merc: function (lat, lng, c) { return { x: this.radius * (lng - c) * this.radDeg, y: -this.radius * Math.log(Math.tan(Math.PI / 4 + lat * Math.PI / 360)) }; }, merc_inv: function (x, y, c) { return { lat: (2 * Math.atan(Math.exp(y / this.radius)) - Math.PI / 2) * this.degRad, lng: (c * this.radDeg + x / this.radius) * this.degRad }; }, aea: function (lat, lng, c) { var fi0 = 0, lambda0 = c * this.radDeg, fi1 = 29.5 * this.radDeg, fi2 = 45.5 * this.radDeg, fi = lat * this.radDeg, lambda = lng * this.radDeg, n = (Math.sin(fi1) + Math.sin(fi2)) / 2, C = Math.cos(fi1) * Math.cos(fi1) + 2 * n * Math.sin(fi1), theta = n * (lambda - lambda0), ro = Math.sqrt(C - 2 * n * Math.sin(fi)) / n, ro0 = Math.sqrt(C - 2 * n * Math.sin(fi0)) / n; return { x: ro * Math.sin(theta) * this.radius, y: -(ro0 - ro * Math.cos(theta)) * this.radius }; }, aea_inv: function (xCoord, yCoord, c) { var x = xCoord / this.radius, y = yCoord / this.radius, fi0 = 0, lambda0 = c * this.radDeg, fi1 = 29.5 * this.radDeg, fi2 = 45.5 * this.radDeg, n = (Math.sin(fi1) + Math.sin(fi2)) / 2, C = Math.cos(fi1) * Math.cos(fi1) + 2 * n * Math.sin(fi1), ro0 = Math.sqrt(C - 2 * n * Math.sin(fi0)) / n, ro = Math.sqrt(x * x + (ro0 - y) * (ro0 - y)), theta = Math.atan(x / (ro0 - y)); return { lat: (Math.asin((C - ro * ro * n * n) / (2 * n))) * this.degRad, lng: (lambda0 + theta / n) * this.degRad }; }, lcc: function (lat, lng, c) { var fi0 = 0, lambda0 = c * this.radDeg, lambda = lng * this.radDeg, fi1 = 33 * this.radDeg, fi2 = 45 * this.radDeg, fi = lat * this.radDeg, n = Math.log(Math.cos(fi1) * (1 / Math.cos(fi2))) / Math.log(Math.tan(Math.PI / 4 + fi2 / 2) * (1 / Math.tan(Math.PI / 4 + fi1 / 2))), F = (Math.cos(fi1) * Math.pow(Math.tan(Math.PI / 4 + fi1 / 2), n)) / n, ro = F * Math.pow(1 / Math.tan(Math.PI / 4 + fi / 2), n), ro0 = F * Math.pow(1 / Math.tan(Math.PI / 4 + fi0 / 2), n); return { x: ro * Math.sin(n * (lambda - lambda0)) * this.radius, y: -(ro0 - ro * Math.cos(n * (lambda - lambda0))) * this.radius }; }, lcc_inv: function (xCoord, yCoord, c) { var x = xCoord / this.radius, y = yCoord / this.radius, fi0 = 0, lambda0 = c * this.radDeg, fi1 = 33 * this.radDeg, fi2 = 45 * this.radDeg, n = Math.log(Math.cos(fi1) * (1 / Math.cos(fi2))) / Math.log(Math.tan(Math.PI / 4 + fi2 / 2) * (1 / Math.tan(Math.PI / 4 + fi1 / 2))), F = (Math.cos(fi1) * Math.pow(Math.tan(Math.PI / 4 + fi1 / 2), n)) / n, ro0 = F * Math.pow(1 / Math.tan(Math.PI / 4 + fi0 / 2), n), ro = this.sgn(n) * Math.sqrt(x * x + (ro0 - y) * (ro0 - y)), theta = Math.atan(x / (ro0 - y)); return { lat: (2 * Math.atan(Math.pow(F / ro, 1 / n)) - Math.PI / 2) * this.degRad, lng: (lambda0 + theta / n) * this.degRad }; } }; jvm.WorldMap = function (params) {
    var map = this, e; this.params = jvm.$.extend(true, {}, jvm.WorldMap.defaultParams, params); if (!jvm.WorldMap.maps[this.params.map]) { throw new Error('Attempt to use map which was not loaded: ' + this.params.map); }
    this.mapData = jvm.WorldMap.maps[this.params.map]; this.markers = {}; this.regions = {}; this.regionsColors = {}; this.regionsData = {}; this.container = jvm.$('<div>').css({ width: '100%', height: '100%' }).addClass('jvectormap-container'); this.params.container.append(this.container); this.container.data('mapObject', this); this.container.css({ position: 'relative', overflow: 'hidden' }); this.defaultWidth = this.mapData.width; this.defaultHeight = this.mapData.height; this.setBackgroundColor(this.params.backgroundColor); this.onResize = function () { map.setSize(); }
    jvm.$(window).resize(this.onResize); for (e in jvm.WorldMap.apiEvents) { if (this.params[e]) { this.container.bind(jvm.WorldMap.apiEvents[e] + '.jvectormap', this.params[e]); } }
    this.canvas = new jvm.VectorCanvas(this.container[0], this.width, this.height); if (('ontouchstart' in window) || (window.DocumentTouch && document instanceof DocumentTouch)) { if (this.params.bindTouchEvents) { this.bindContainerTouchEvents(); } } else { this.bindContainerEvents(); }
    this.bindElementEvents(); this.createLabel(); if (this.params.zoomButtons) { this.bindZoomButtons(); }
    this.createRegions(); this.createMarkers(this.params.markers || {}); this.setSize(); if (this.params.focusOn) { if (typeof this.params.focusOn === 'object') { this.setFocus.call(this, this.params.focusOn.scale, this.params.focusOn.x, this.params.focusOn.y); } else { this.setFocus.call(this, this.params.focusOn); } }
    if (this.params.selectedRegions) { this.setSelectedRegions(this.params.selectedRegions); }
    if (this.params.selectedMarkers) { this.setSelectedMarkers(this.params.selectedMarkers); }
    if (this.params.series) { this.createSeries(); }
}; jvm.WorldMap.prototype = {
    transX: 0, transY: 0, scale: 1, baseTransX: 0, baseTransY: 0, baseScale: 1, width: 0, height: 0, setBackgroundColor: function (backgroundColor) { this.container.css('background-color', backgroundColor); }, resize: function () {
        var curBaseScale = this.baseScale; if (this.width / this.height > this.defaultWidth / this.defaultHeight) { this.baseScale = this.height / this.defaultHeight; this.baseTransX = Math.abs(this.width - this.defaultWidth * this.baseScale) / (2 * this.baseScale); } else { this.baseScale = this.width / this.defaultWidth; this.baseTransY = Math.abs(this.height - this.defaultHeight * this.baseScale) / (2 * this.baseScale); }
        this.scale *= this.baseScale / curBaseScale; this.transX *= this.baseScale / curBaseScale; this.transY *= this.baseScale / curBaseScale;
    }, setSize: function () { this.width = this.container.width(); this.height = this.container.height(); this.resize(); this.canvas.setSize(this.width, this.height); this.applyTransform(); }, reset: function () {
        var key, i; for (key in this.series) { for (i = 0; i < this.series[key].length; i++) { this.series[key][i].clear(); } }
        this.scale = this.baseScale; this.transX = this.baseTransX; this.transY = this.baseTransY; this.applyTransform();
    }, applyTransform: function () {
        var maxTransX, maxTransY, minTransX, minTransY; if (this.defaultWidth * this.scale <= this.width) { maxTransX = (this.width - this.defaultWidth * this.scale) / (2 * this.scale); minTransX = (this.width - this.defaultWidth * this.scale) / (2 * this.scale); } else { maxTransX = 0; minTransX = (this.width - this.defaultWidth * this.scale) / this.scale; }
        if (this.defaultHeight * this.scale <= this.height) { maxTransY = (this.height - this.defaultHeight * this.scale) / (2 * this.scale); minTransY = (this.height - this.defaultHeight * this.scale) / (2 * this.scale); } else { maxTransY = 0; minTransY = (this.height - this.defaultHeight * this.scale) / this.scale; }
        if (this.transY > maxTransY) { this.transY = maxTransY; } else if (this.transY < minTransY) { this.transY = minTransY; }
        if (this.transX > maxTransX) { this.transX = maxTransX; } else if (this.transX < minTransX) { this.transX = minTransX; }
        this.canvas.applyTransformParams(this.scale, this.transX, this.transY); if (this.markers) { this.repositionMarkers(); }
        this.container.trigger('viewportChange', [this.scale / this.baseScale, this.transX, this.transY]);
    }, bindContainerEvents: function () {
        var mouseDown = false, oldPageX, oldPageY, map = this; this.container.mousemove(function (e) {
            if (mouseDown) { map.transX -= (oldPageX - e.pageX) / map.scale; map.transY -= (oldPageY - e.pageY) / map.scale; map.applyTransform(); oldPageX = e.pageX; oldPageY = e.pageY; }
            return false;
        }).mousedown(function (e) { mouseDown = true; oldPageX = e.pageX; oldPageY = e.pageY; return false; }); jvm.$('body').mouseup(function () { mouseDown = false; }); if (this.params.zoomOnScroll) { this.container.mousewheel(function (event, delta, deltaX, deltaY) { var offset = jvm.$(map.container).offset(), centerX = event.pageX - offset.left, centerY = event.pageY - offset.top, zoomStep = Math.pow(1.3, deltaY); map.setScale(map.scale * zoomStep, centerX, centerY); event.preventDefault(); }); }
    }, bindContainerTouchEvents: function () {
        var touchStartScale, touchStartDistance, map = this, touchX, touchY, centerTouchX, centerTouchY, lastTouchesLength, handleTouchEvent = function (e) {
            var touches = e.originalEvent.touches, offset, scale, transXOld, transYOld; if (e.type == 'touchstart') { lastTouchesLength = 0; }
            if (touches.length == 1) {
                if (lastTouchesLength == 1) { transXOld = map.transX; transYOld = map.transY; map.transX -= (touchX - touches[0].pageX) / map.scale; map.transY -= (touchY - touches[0].pageY) / map.scale; map.applyTransform(); if (transXOld != map.transX || transYOld != map.transY) { e.preventDefault(); } }
                touchX = touches[0].pageX; touchY = touches[0].pageY;
            } else if (touches.length == 2) {
                if (lastTouchesLength == 2) {
                    scale = Math.sqrt(Math.pow(touches[0].pageX - touches[1].pageX, 2) +
                    Math.pow(touches[0].pageY - touches[1].pageY, 2)) / touchStartDistance; map.setScale(touchStartScale * scale, centerTouchX, centerTouchY)
                    e.preventDefault();
                } else {
                    offset = jvm.$(map.container).offset(); if (touches[0].pageX > touches[1].pageX) { centerTouchX = touches[1].pageX + (touches[0].pageX - touches[1].pageX) / 2; } else { centerTouchX = touches[0].pageX + (touches[1].pageX - touches[0].pageX) / 2; }
                    if (touches[0].pageY > touches[1].pageY) { centerTouchY = touches[1].pageY + (touches[0].pageY - touches[1].pageY) / 2; } else { centerTouchY = touches[0].pageY + (touches[1].pageY - touches[0].pageY) / 2; }
                    centerTouchX -= offset.left; centerTouchY -= offset.top; touchStartScale = map.scale; touchStartDistance = Math.sqrt(Math.pow(touches[0].pageX - touches[1].pageX, 2) +
                    Math.pow(touches[0].pageY - touches[1].pageY, 2));
                }
            }
            lastTouchesLength = touches.length;
        }; jvm.$(this.container).bind('touchstart', handleTouchEvent); jvm.$(this.container).bind('touchmove', handleTouchEvent);
    }, bindElementEvents: function () {
        var map = this, mouseMoved; this.container.mousemove(function () { mouseMoved = true; }); this.container.delegate("[class~='jvectormap-element']", 'mouseover mouseout', function (e) {
            var path = this, baseVal = jvm.$(this).attr('class').baseVal ? jvm.$(this).attr('class').baseVal : jvm.$(this).attr('class'), type = baseVal.indexOf('jvectormap-region') === -1 ? 'marker' : 'region', code = type == 'region' ? jvm.$(this).attr('data-code') : jvm.$(this).attr('data-index'), element = type == 'region' ? map.regions[code].element : map.markers[code].element, labelText = type == 'region' ? map.mapData.paths[code].name : (map.markers[code].config.name || ''), labelShowEvent = jvm.$.Event(type + 'LabelShow.jvectormap'), overEvent = jvm.$.Event(type + 'Over.jvectormap'); if (e.type == 'mouseover') {
                map.container.trigger(overEvent, [code]); if (!overEvent.isDefaultPrevented()) { element.setHovered(true); }
                if (!labelShowEvent.isDefaultPrevented()) { }
            } else { element.setHovered(false); map.container.trigger(type + 'Out.jvectormap', [code]); }
        }); this.container.delegate("[class~='jvectormap-element']", 'mousedown', function (e) { mouseMoved = false; }); this.container.delegate("[class~='jvectormap-element']", 'mouseup', function (e) {
            var path = this, baseVal = jvm.$(this).attr('class').baseVal ? jvm.$(this).attr('class').baseVal : jvm.$(this).attr('class'), type = baseVal.indexOf('jvectormap-region') === -1 ? 'marker' : 'region', code = type == 'region' ? jvm.$(this).attr('data-code') : jvm.$(this).attr('data-index'), clickEvent = jvm.$.Event(type + 'Click.jvectormap'), element = type == 'region' ? map.regions[code].element : map.markers[code].element; if (!mouseMoved) {
                map.container.trigger(clickEvent, [code]); if ((type === 'region' && map.params.regionsSelectable) || (type === 'marker' && map.params.markersSelectable)) {
                    if (!clickEvent.isDefaultPrevented()) {
                        if (map.params[type + 'sSelectableOne']) { map.clearSelected(type + 's'); }
                        element.setSelected(!element.isSelected);
                    }
                }
            }
        });
    }, bindZoomButtons: function () { }, createLabel: function () { }, setScale: function (scale, anchorX, anchorY, isCentered) {
        var zoomStep, viewportChangeEvent = jvm.$.Event('zoom.jvectormap'); if (scale > this.params.zoomMax * this.baseScale) { scale = this.params.zoomMax * this.baseScale; } else if (scale < this.params.zoomMin * this.baseScale) { scale = this.params.zoomMin * this.baseScale; }
        if (typeof anchorX != 'undefined' && typeof anchorY != 'undefined') { zoomStep = scale / this.scale; if (isCentered) { this.transX = anchorX + this.defaultWidth * (this.width / (this.defaultWidth * scale)) / 2; this.transY = anchorY + this.defaultHeight * (this.height / (this.defaultHeight * scale)) / 2; } else { this.transX -= (zoomStep - 1) / scale * anchorX; this.transY -= (zoomStep - 1) / scale * anchorY; } }
        this.scale = scale; this.applyTransform(); this.container.trigger(viewportChangeEvent, [scale / this.baseScale]);
    }, setFocus: function (scale, centerX, centerY) {
        var bbox, itemBbox, newBbox, codes, i; if (jvm.$.isArray(scale) || this.regions[scale]) {
            if (jvm.$.isArray(scale)) { codes = scale; } else { codes = [scale] }
            for (i = 0; i < codes.length; i++) {
                if (this.regions[codes[i]]) {
                    itemBbox = this.regions[codes[i]].element.getBBox(); if (itemBbox) {
                        if (typeof bbox == 'undefined') { bbox = itemBbox; } else {
                            newBbox = { x: Math.min(bbox.x, itemBbox.x), y: Math.min(bbox.y, itemBbox.y), width: Math.max(bbox.x + bbox.width, itemBbox.x + itemBbox.width) - Math.min(bbox.x, itemBbox.x), height: Math.max(bbox.y + bbox.height, itemBbox.y + itemBbox.height) - Math.min(bbox.y, itemBbox.y) }
                            bbox = newBbox;
                        }
                    }
                }
            }
            this.setScale(Math.min(this.width / bbox.width, this.height / bbox.height), -(bbox.x + bbox.width / 2), -(bbox.y + bbox.height / 2), true);
        } else { scale = scale * this.baseScale; this.setScale(scale, -centerX * this.defaultWidth, -centerY * this.defaultHeight, true); }
    }, getSelected: function (type) {
        var key, selected = []; for (key in this[type]) { if (this[type][key].element.isSelected) { selected.push(key); } }
        return selected;
    }, getSelectedRegions: function () { return this.getSelected('regions'); }, getSelectedMarkers: function () { return this.getSelected('markers'); }, setSelected: function (type, keys) {
        var i; if (typeof keys != 'object') { keys = [keys]; }
        if (jvm.$.isArray(keys)) { for (i = 0; i < keys.length; i++) { this[type][keys[i]].element.setSelected(true); } } else { for (i in keys) { this[type][i].element.setSelected(!!keys[i]); } }
    }, setSelectedRegions: function (keys) { this.setSelected('regions', keys); }, setSelectedMarkers: function (keys) { this.setSelected('markers', keys); }, clearSelected: function (type) { var select = {}, selected = this.getSelected(type), i; for (i = 0; i < selected.length; i++) { select[selected[i]] = false; }; this.setSelected(type, select); }, clearSelectedRegions: function () { this.clearSelected('regions'); }, clearSelectedMarkers: function () { this.clearSelected('markers'); }, getMapObject: function () { return this; }, getRegionName: function (code) { return this.mapData.paths[code].name; }, createRegions: function () { var key, region, map = this; for (key in this.mapData.paths) { region = this.canvas.addPath({ d: this.mapData.paths[key].path, "data-code": key }, jvm.$.extend(true, {}, this.params.regionStyle)); jvm.$(region.node).bind('selected', function (e, isSelected) { map.container.trigger('regionSelected.jvectormap', [jvm.$(this).attr('data-code'), isSelected, map.getSelectedRegions()]); }); region.addClass('jvectormap-region jvectormap-element'); this.regions[key] = { element: region, config: this.mapData.paths[key] }; } }, createMarkers: function (markers) {
        var i, marker, point, markerConfig, markersArray, map = this; this.markersGroup = this.markersGroup || this.canvas.addGroup(); if (jvm.$.isArray(markers)) { markersArray = markers.slice(); markers = {}; for (i = 0; i < markersArray.length; i++) { markers[i] = markersArray[i]; } }
        for (i in markers) {
            markerConfig = markers[i] instanceof Array ? { latLng: markers[i] } : markers[i]; point = this.getMarkerPosition(markerConfig); if (point !== false) {
                marker = this.canvas.addCircle({ "data-index": i, cx: point.x, cy: point.y }, jvm.$.extend(true, {}, this.params.markerStyle, { initial: markerConfig.style || {} }), this.markersGroup); marker.addClass('jvectormap-marker jvectormap-element'); jvm.$(marker.node).bind('selected', function (e, isSelected) { map.container.trigger('markerSelected.jvectormap', [jvm.$(this).attr('data-index'), isSelected, map.getSelectedMarkers()]); }); if (this.markers[i]) { this.removeMarkers([i]); }
                this.markers[i] = { element: marker, config: markerConfig };
            }
        }
    }, repositionMarkers: function () { var i, point; for (i in this.markers) { point = this.getMarkerPosition(this.markers[i].config); if (point !== false) { this.markers[i].element.setStyle({ cx: point.x, cy: point.y }); } } }, getMarkerPosition: function (markerConfig) { if (jvm.WorldMap.maps[this.params.map].projection) { return this.latLngToPoint.apply(this, markerConfig.latLng || [0, 0]); } else { return { x: markerConfig.coords[0] * this.scale + this.transX * this.scale, y: markerConfig.coords[1] * this.scale + this.transY * this.scale }; } }, addMarker: function (key, marker, seriesData) {
        var markers = {}, data = [], values, i, seriesData = seriesData || []; markers[key] = marker; for (i = 0; i < seriesData.length; i++) { values = {}; values[key] = seriesData[i]; data.push(values); }
        this.addMarkers(markers, data);
    }, addMarkers: function (markers, seriesData) { var i; seriesData = seriesData || []; this.createMarkers(markers); for (i = 0; i < seriesData.length; i++) { this.series.markers[i].setValues(seriesData[i] || {}); }; }, removeMarkers: function (markers) { var i; for (i = 0; i < markers.length; i++) { this.markers[markers[i]].element.remove(); delete this.markers[markers[i]]; }; }, removeAllMarkers: function () {
        var i, markers = []; for (i in this.markers) { markers.push(i); }
        this.removeMarkers(markers)
    }, latLngToPoint: function (lat, lng) {
        var point, proj = jvm.WorldMap.maps[this.params.map].projection, centralMeridian = proj.centralMeridian, width = this.width - this.baseTransX * 2 * this.baseScale, height = this.height - this.baseTransY * 2 * this.baseScale, inset, bbox, scaleFactor = this.scale / this.baseScale; if (lng < (-180 + centralMeridian)) { lng += 360; }
        point = jvm.Proj[proj.type](lat, lng, centralMeridian); inset = this.getInsetForPoint(point.x, point.y); if (inset) { bbox = inset.bbox; point.x = (point.x - bbox[0].x) / (bbox[1].x - bbox[0].x) * inset.width * this.scale; point.y = (point.y - bbox[0].y) / (bbox[1].y - bbox[0].y) * inset.height * this.scale; return { x: point.x + this.transX * this.scale + inset.left * this.scale, y: point.y + this.transY * this.scale + inset.top * this.scale }; } else { return false; }
    }, pointToLatLng: function (x, y) {
        var proj = jvm.WorldMap.maps[this.params.map].projection, centralMeridian = proj.centralMeridian, insets = jvm.WorldMap.maps[this.params.map].insets, i, inset, bbox, nx, ny; for (i = 0; i < insets.length; i++) { inset = insets[i]; bbox = inset.bbox; nx = x - (this.transX * this.scale + inset.left * this.scale); ny = y - (this.transY * this.scale + inset.top * this.scale); nx = (nx / (inset.width * this.scale)) * (bbox[1].x - bbox[0].x) + bbox[0].x; ny = (ny / (inset.height * this.scale)) * (bbox[1].y - bbox[0].y) + bbox[0].y; if (nx > bbox[0].x && nx < bbox[1].x && ny > bbox[0].y && ny < bbox[1].y) { return jvm.Proj[proj.type + '_inv'](nx, -ny, centralMeridian); } }
        return false;
    }, getInsetForPoint: function (x, y) { var insets = jvm.WorldMap.maps[this.params.map].insets, i, bbox; for (i = 0; i < insets.length; i++) { bbox = insets[i].bbox; if (x > bbox[0].x && x < bbox[1].x && y > bbox[0].y && y < bbox[1].y) { return insets[i]; } } }, createSeries: function () { var i, key; this.series = { markers: [], regions: [] }; for (key in this.params.series) { for (i = 0; i < this.params.series[key].length; i++) { this.series[key][i] = new jvm.DataSeries(this.params.series[key][i], this[key]); } } }, remove: function () { this.container.remove(); jvm.$(window).unbind('resize', this.onResize); }
}; jvm.WorldMap.maps = {}; jvm.WorldMap.defaultParams = { map: 'world_mill_en', backgroundColor: '', zoomButtons: false, zoomOnScroll: false, zoomMax: 1, zoomMin: 1, zoomStep: 1.6, regionsSelectable: false, markersSelectable: false, bindTouchEvents: true, regionStyle: { initial: { fill: '#1fafff', "fill-opacity": 1, stroke: '#ffffff', "stroke-width": 1.5, "stroke-opacity": 1 }, hover: { fill: '#ffbc00' }, selected: { fill: '#819CC2' }, selectedHover: {} }, markerStyle: { initial: { fill: '#819CC2', stroke: '#819CC2', "fill-opacity": 1, "stroke-width": 1, "stroke-opacity": 1, r: 5 }, hover: { stroke: '#7A93D6', "stroke-width": 2 }, selected: { fill: '#819CC2' }, selectedHover: {} } }; jvm.WorldMap.apiEvents = { onRegionLabelShow: 'regionLabelShow', onRegionOver: 'regionOver', onRegionOut: 'regionOut', onRegionClick: 'regionClick', onRegionSelected: 'regionSelected', onMarkerLabelShow: 'markerLabelShow', onMarkerOver: 'markerOver', onMarkerOut: 'markerOut', onMarkerClick: 'markerClick', onMarkerSelected: 'markerSelected', onViewportChange: 'viewportChange' };