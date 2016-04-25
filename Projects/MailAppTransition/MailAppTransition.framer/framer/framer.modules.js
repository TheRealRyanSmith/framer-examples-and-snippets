require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"highlightr":[function(require,module,exports){

/*
 | Highlightr v1.0.0 - 2015-09-02
 | A custom Framer.js module that shows hotspots over clickable Layers in your prototype
 | https://github.com/jonahvsweb/Framer-Highlightr
 |
 | Copyright (c) 2015 Jonah Bitautas <jonahvsweb@gmail.com>
 |
 | Released under the MIT license
 */
var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty,
  slice = [].slice;

window.Layer = (function(superClass) {
  extend(Layer, superClass);

  function Layer(options) {
    if (options == null) {
      options = {};
    }
    this.addListener = bind(this.addListener, this);
    if (options.highlight == null) {
      options.highlight = false;
    }
    Layer.__super__.constructor.call(this, options);
    if (options.highlight) {
      this._dispatch();
    }
  }

  Layer.prototype.addListener = function() {
    var eventNames, j, originalListener;
    eventNames = 2 <= arguments.length ? slice.call(arguments, 0, j = arguments.length - 1) : (j = 0, []), originalListener = arguments[j++];
    Layer.__super__.addListener.apply(this, arguments);
    return this._element.classList.add('pitchr');
  };

  Layer.prototype._dispatch = function() {
    return this.addListener(exports.clickTap, function(e) {
      var evt;
      evt = new CustomEvent('pitchr', {
        detail: {
          message: {
            targ: e.currentTarget,
            x: this.x,
            y: this.y,
            width: this.width,
            height: this.height
          }
        },
        bubbles: true,
        cancelable: true
      });
      return e.currentTarget.dispatchEvent(evt);
    });
  };

  return Layer;

})(Layer);

exports.clickTap = 'ontouchstart' in window ? 'touchstart' : 'click';

exports.killAllHighlights = false;

exports.highlightr = function() {
  var hasPitchr, pitchrs;
  hasPitchr = false;
  pitchrs = [];
  window.addEventListener('pitchr', function(e) {
    var j, layer, layerList, len, results;
    if (!exports.killAllHighlights) {
      layerList = window.Framer.CurrentContext.getLayers();
      pitchrs = [];
      results = [];
      for (j = 0, len = layerList.length; j < len; j++) {
        layer = layerList[j];
        if (layer.classList.contains('pitchr')) {
          pitchrs.push(layer);
          results.push(hasPitchr = true);
        } else {
          results.push(void 0);
        }
      }
      return results;
    }
  });
  return window.addEventListener(exports.clickTap, function(e) {
    var hotSpot, i, j, layer, layerList, len, results;
    if (!exports.killAllHighlights) {
      if (pitchrs.length <= 0) {
        layerList = window.Framer.CurrentContext.getLayers();
      } else {
        layerList = pitchrs;
      }
      results = [];
      for (i = j = 0, len = layerList.length; j < len; i = ++j) {
        layer = layerList[i];
        if (layer.classList.contains('pitchr')) {
          if (hasPitchr) {
            if (i === layerList.length - 1) {
              results.push(hasPitchr = false);
            } else {
              results.push(void 0);
            }
          } else {
            hotSpot = new Layer({
              name: 'hotSpot' + i,
              superLayer: layer.superLayer,
              x: layer.x,
              y: layer.y,
              width: layer.width,
              height: layer.height,
              backgroundColor: 'rgba(100, 240, 244, 0.5)'
            });
            hotSpot.animate({
              properties: {
                opacity: 0
              },
              time: 0.4,
              curve: 'ease-in-out',
              delay: 0.2
            });
            results.push(hotSpot.on(Events.AnimationStop, function() {
              return this.destroy();
            }));
          }
        } else {
          results.push(void 0);
        }
      }
      return results;
    }
  });
};

exports.highlightr();


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvcnlhbnNtaXRoL0Ryb3Bib3gvcHJvamVjdHMvZ2l0aHViIHN0dWZmL19VcGRhdGVfRnJhbWVyX0V4YW1wbGVzL01haWxBcHBUcmFuc2l0aW9uLmZyYW1lci9tb2R1bGVzL2hpZ2hsaWdodHIuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOztBQ0FBOzs7Ozs7Ozs7QUFBQSxJQUFBOzs7OztBQVNNLE1BQU0sQ0FBQzs7O0VBRUMsZUFBQyxPQUFEOztNQUFDLFVBQVE7Ozs7TUFDckIsT0FBTyxDQUFDLFlBQWE7O0lBQ3JCLHVDQUFNLE9BQU47SUFFQSxJQUFHLE9BQU8sQ0FBQyxTQUFYO01BQ0MsSUFBQyxDQUFBLFNBQUQsQ0FBQSxFQUREOztFQUpZOztrQkFPYixXQUFBLEdBQWEsU0FBQTtBQUNaLFFBQUE7SUFEYSx1R0FBZTtJQUM1Qix3Q0FBQSxTQUFBO1dBQ0EsSUFBQyxDQUFBLFFBQVEsQ0FBQyxTQUFTLENBQUMsR0FBcEIsQ0FBd0IsUUFBeEI7RUFGWTs7a0JBSWIsU0FBQSxHQUFXLFNBQUE7V0FDVixJQUFJLENBQUMsV0FBTCxDQUFpQixPQUFPLENBQUMsUUFBekIsRUFBbUMsU0FBQyxDQUFEO0FBQ2xDLFVBQUE7TUFBQSxHQUFBLEdBQVUsSUFBQSxXQUFBLENBQVksUUFBWixFQUNUO1FBQUEsTUFBQSxFQUNDO1VBQUEsT0FBQSxFQUNDO1lBQUEsSUFBQSxFQUFNLENBQUMsQ0FBQyxhQUFSO1lBQ0EsQ0FBQSxFQUFHLElBQUksQ0FBQyxDQURSO1lBRUEsQ0FBQSxFQUFHLElBQUksQ0FBQyxDQUZSO1lBR0EsS0FBQSxFQUFPLElBQUksQ0FBQyxLQUhaO1lBSUEsTUFBQSxFQUFRLElBQUksQ0FBQyxNQUpiO1dBREQ7U0FERDtRQU9BLE9BQUEsRUFBUyxJQVBUO1FBUUEsVUFBQSxFQUFZLElBUlo7T0FEUzthQVdWLENBQUMsQ0FBQyxhQUFhLENBQUMsYUFBaEIsQ0FBOEIsR0FBOUI7SUFaa0MsQ0FBbkM7RUFEVTs7OztHQWJlOztBQTRCM0IsT0FBTyxDQUFDLFFBQVIsR0FBc0IsY0FBQSxJQUFrQixNQUFyQixHQUFpQyxZQUFqQyxHQUFtRDs7QUFDdEUsT0FBTyxDQUFDLGlCQUFSLEdBQTRCOztBQUU1QixPQUFPLENBQUMsVUFBUixHQUFxQixTQUFBO0FBQ3BCLE1BQUE7RUFBQSxTQUFBLEdBQVk7RUFDWixPQUFBLEdBQVU7RUFFVixNQUFNLENBQUMsZ0JBQVAsQ0FBd0IsUUFBeEIsRUFBa0MsU0FBQyxDQUFEO0FBQ2pDLFFBQUE7SUFBQSxJQUFHLENBQUMsT0FBTyxDQUFDLGlCQUFaO01BQ0MsU0FBQSxHQUFZLE1BQU0sQ0FBQyxNQUFNLENBQUMsY0FBYyxDQUFDLFNBQTdCLENBQUE7TUFDWixPQUFBLEdBQVU7QUFFVjtXQUFBLDJDQUFBOztRQUNDLElBQUcsS0FBSyxDQUFDLFNBQVMsQ0FBQyxRQUFoQixDQUF5QixRQUF6QixDQUFIO1VBQ0MsT0FBTyxDQUFDLElBQVIsQ0FBYSxLQUFiO3VCQUNBLFNBQUEsR0FBWSxNQUZiO1NBQUEsTUFBQTsrQkFBQTs7QUFERDtxQkFKRDs7RUFEaUMsQ0FBbEM7U0FVQSxNQUFNLENBQUMsZ0JBQVAsQ0FBd0IsT0FBTyxDQUFDLFFBQWhDLEVBQTBDLFNBQUMsQ0FBRDtBQUN6QyxRQUFBO0lBQUEsSUFBRyxDQUFDLE9BQU8sQ0FBQyxpQkFBWjtNQUNDLElBQUcsT0FBTyxDQUFDLE1BQVIsSUFBa0IsQ0FBckI7UUFDQyxTQUFBLEdBQVksTUFBTSxDQUFDLE1BQU0sQ0FBQyxjQUFjLENBQUMsU0FBN0IsQ0FBQSxFQURiO09BQUEsTUFBQTtRQUdDLFNBQUEsR0FBWSxRQUhiOztBQUtBO1dBQUEsbURBQUE7O1FBQ0MsSUFBRyxLQUFLLENBQUMsU0FBUyxDQUFDLFFBQWhCLENBQXlCLFFBQXpCLENBQUg7VUFDQyxJQUFHLFNBQUg7WUFDQyxJQUFHLENBQUEsS0FBSyxTQUFTLENBQUMsTUFBVixHQUFtQixDQUEzQjsyQkFDQyxTQUFBLEdBQVksT0FEYjthQUFBLE1BQUE7bUNBQUE7YUFERDtXQUFBLE1BQUE7WUFJQyxPQUFBLEdBQWMsSUFBQSxLQUFBLENBQ2I7Y0FBQSxJQUFBLEVBQU0sU0FBQSxHQUFZLENBQWxCO2NBQ0EsVUFBQSxFQUFZLEtBQUssQ0FBQyxVQURsQjtjQUVBLENBQUEsRUFBRyxLQUFLLENBQUMsQ0FGVDtjQUdBLENBQUEsRUFBRyxLQUFLLENBQUMsQ0FIVDtjQUlBLEtBQUEsRUFBTyxLQUFLLENBQUMsS0FKYjtjQUtBLE1BQUEsRUFBUSxLQUFLLENBQUMsTUFMZDtjQU1BLGVBQUEsRUFBaUIsMEJBTmpCO2FBRGE7WUFTZCxPQUFPLENBQUMsT0FBUixDQUNDO2NBQUEsVUFBQSxFQUNDO2dCQUFBLE9BQUEsRUFBUyxDQUFUO2VBREQ7Y0FFQSxJQUFBLEVBQU0sR0FGTjtjQUdBLEtBQUEsRUFBTyxhQUhQO2NBSUEsS0FBQSxFQUFPLEdBSlA7YUFERDt5QkFPQSxPQUFPLENBQUMsRUFBUixDQUFXLE1BQU0sQ0FBQyxhQUFsQixFQUFpQyxTQUFBO3FCQUNoQyxJQUFJLENBQUMsT0FBTCxDQUFBO1lBRGdDLENBQWpDLEdBcEJEO1dBREQ7U0FBQSxNQUFBOytCQUFBOztBQUREO3FCQU5EOztFQUR5QyxDQUExQztBQWRvQjs7QUE4Q3JCLE9BQU8sQ0FBQyxVQUFSLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiIyMjXG4gfCBIaWdobGlnaHRyIHYxLjAuMCAtIDIwMTUtMDktMDJcbiB8IEEgY3VzdG9tIEZyYW1lci5qcyBtb2R1bGUgdGhhdCBzaG93cyBob3RzcG90cyBvdmVyIGNsaWNrYWJsZSBMYXllcnMgaW4geW91ciBwcm90b3R5cGVcbiB8IGh0dHBzOi8vZ2l0aHViLmNvbS9qb25haHZzd2ViL0ZyYW1lci1IaWdobGlnaHRyXG4gfFxuIHwgQ29weXJpZ2h0IChjKSAyMDE1IEpvbmFoIEJpdGF1dGFzIDxqb25haHZzd2ViQGdtYWlsLmNvbT5cbiB8XG4gfCBSZWxlYXNlZCB1bmRlciB0aGUgTUlUIGxpY2Vuc2VcbiMjI1xuY2xhc3Mgd2luZG93LkxheWVyIGV4dGVuZHMgTGF5ZXJcblxuXHRjb25zdHJ1Y3RvcjogKG9wdGlvbnM9e30pIC0+XG5cdFx0b3B0aW9ucy5oaWdobGlnaHQgPz0gZmFsc2Vcblx0XHRzdXBlciBvcHRpb25zXG5cblx0XHRpZiBvcHRpb25zLmhpZ2hsaWdodFxuXHRcdFx0QF9kaXNwYXRjaCgpXG5cblx0YWRkTGlzdGVuZXI6IChldmVudE5hbWVzLi4uLCBvcmlnaW5hbExpc3RlbmVyKSA9PlxuXHRcdHN1cGVyXG5cdFx0QF9lbGVtZW50LmNsYXNzTGlzdC5hZGQgJ3BpdGNocidcblxuXHRfZGlzcGF0Y2g6IC0+XG5cdFx0dGhpcy5hZGRMaXN0ZW5lciBleHBvcnRzLmNsaWNrVGFwLCAoZSkgLT5cblx0XHRcdGV2dCA9IG5ldyBDdXN0b21FdmVudCAncGl0Y2hyJyxcblx0XHRcdFx0ZGV0YWlsOlxuXHRcdFx0XHRcdG1lc3NhZ2U6XG5cdFx0XHRcdFx0XHR0YXJnOiBlLmN1cnJlbnRUYXJnZXRcblx0XHRcdFx0XHRcdHg6IHRoaXMueFxuXHRcdFx0XHRcdFx0eTogdGhpcy55XG5cdFx0XHRcdFx0XHR3aWR0aDogdGhpcy53aWR0aFxuXHRcdFx0XHRcdFx0aGVpZ2h0OiB0aGlzLmhlaWdodFxuXHRcdFx0XHRidWJibGVzOiB0cnVlXG5cdFx0XHRcdGNhbmNlbGFibGU6IHRydWVcblxuXHRcdFx0ZS5jdXJyZW50VGFyZ2V0LmRpc3BhdGNoRXZlbnQgZXZ0XG5cbmV4cG9ydHMuY2xpY2tUYXAgPSBpZiAnb250b3VjaHN0YXJ0JyBvZiB3aW5kb3cgdGhlbiAndG91Y2hzdGFydCcgZWxzZSAnY2xpY2snXG5leHBvcnRzLmtpbGxBbGxIaWdobGlnaHRzID0gZmFsc2VcblxuZXhwb3J0cy5oaWdobGlnaHRyID0gLT5cblx0aGFzUGl0Y2hyID0gZmFsc2Vcblx0cGl0Y2hycyA9IFtdXG5cblx0d2luZG93LmFkZEV2ZW50TGlzdGVuZXIgJ3BpdGNocicsIChlKSAtPlxuXHRcdGlmICFleHBvcnRzLmtpbGxBbGxIaWdobGlnaHRzXG5cdFx0XHRsYXllckxpc3QgPSB3aW5kb3cuRnJhbWVyLkN1cnJlbnRDb250ZXh0LmdldExheWVycygpXG5cdFx0XHRwaXRjaHJzID0gW11cblxuXHRcdFx0Zm9yIGxheWVyIGluIGxheWVyTGlzdFxuXHRcdFx0XHRpZiBsYXllci5jbGFzc0xpc3QuY29udGFpbnMgJ3BpdGNocidcblx0XHRcdFx0XHRwaXRjaHJzLnB1c2ggbGF5ZXJcblx0XHRcdFx0XHRoYXNQaXRjaHIgPSB0cnVlXG5cblx0d2luZG93LmFkZEV2ZW50TGlzdGVuZXIgZXhwb3J0cy5jbGlja1RhcCwgKGUpIC0+XG5cdFx0aWYgIWV4cG9ydHMua2lsbEFsbEhpZ2hsaWdodHNcblx0XHRcdGlmIHBpdGNocnMubGVuZ3RoIDw9IDBcblx0XHRcdFx0bGF5ZXJMaXN0ID0gd2luZG93LkZyYW1lci5DdXJyZW50Q29udGV4dC5nZXRMYXllcnMoKVxuXHRcdFx0ZWxzZVxuXHRcdFx0XHRsYXllckxpc3QgPSBwaXRjaHJzXG5cblx0XHRcdGZvciBsYXllciwgaSBpbiBsYXllckxpc3Rcblx0XHRcdFx0aWYgbGF5ZXIuY2xhc3NMaXN0LmNvbnRhaW5zICdwaXRjaHInXG5cdFx0XHRcdFx0aWYgaGFzUGl0Y2hyXG5cdFx0XHRcdFx0XHRpZiBpID09IGxheWVyTGlzdC5sZW5ndGggLSAxXG5cdFx0XHRcdFx0XHRcdGhhc1BpdGNociA9IGZhbHNlXG5cdFx0XHRcdFx0ZWxzZVxuXHRcdFx0XHRcdFx0aG90U3BvdCA9IG5ldyBMYXllclxuXHRcdFx0XHRcdFx0XHRuYW1lOiAnaG90U3BvdCcgKyBpXG5cdFx0XHRcdFx0XHRcdHN1cGVyTGF5ZXI6IGxheWVyLnN1cGVyTGF5ZXJcblx0XHRcdFx0XHRcdFx0eDogbGF5ZXIueFxuXHRcdFx0XHRcdFx0XHR5OiBsYXllci55XG5cdFx0XHRcdFx0XHRcdHdpZHRoOiBsYXllci53aWR0aFxuXHRcdFx0XHRcdFx0XHRoZWlnaHQ6IGxheWVyLmhlaWdodFxuXHRcdFx0XHRcdFx0XHRiYWNrZ3JvdW5kQ29sb3I6ICdyZ2JhKDEwMCwgMjQwLCAyNDQsIDAuNSknXG5cblx0XHRcdFx0XHRcdGhvdFNwb3QuYW5pbWF0ZVxuXHRcdFx0XHRcdFx0XHRwcm9wZXJ0aWVzOlxuXHRcdFx0XHRcdFx0XHRcdG9wYWNpdHk6IDBcblx0XHRcdFx0XHRcdFx0dGltZTogMC40XG5cdFx0XHRcdFx0XHRcdGN1cnZlOiAnZWFzZS1pbi1vdXQnXG5cdFx0XHRcdFx0XHRcdGRlbGF5OiAwLjJcblxuXHRcdFx0XHRcdFx0aG90U3BvdC5vbiBFdmVudHMuQW5pbWF0aW9uU3RvcCwgLT5cblx0XHRcdFx0XHRcdFx0dGhpcy5kZXN0cm95KClcblxuZXhwb3J0cy5oaWdobGlnaHRyKClcblxuIl19
