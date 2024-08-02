audioClick = new Audio('https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-18146/zapsplat_multimedia_click_001_19367.mp3');

audioClick.volume = 0.2;

'use strict';

var DEFAULT_SIZE = 150;
var MIN_SECTORS  = 3;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RadialMenu(params) {
    var self = this;

    self.parent  = params.parent  || [];

    self.size      = params.size    || DEFAULT_SIZE;
    self.onClick   = params.onClick || null;
    self.menuItems = params.menuItems ? params.menuItems : [{id: 'one', title: 'One'}, {id: 'two', title: 'Two'}];

    self.radius      = 55;
    self.innerRadius = 18;
    self.sectorSpace = 3.5;
    self.sectorCount = Math.max(self.menuItems.length, MIN_SECTORS);
    self.closeOnClick = params.closeOnClick !== undefined ? !!params.closeOnClick : false;

    self.scale       = 1;
    self.holder      = null;
    self.parentMenu  = [];
    self.parentItems = [];
    self.levelItems  = null;

    self.createHolder();
    self.addIconSymbols();

    self.currentMenu = null;
    document.addEventListener('wheel', self.onMouseWheel.bind(self));
    document.addEventListener('keydown', self.onKeyDown.bind(self));
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.open = function () {
    var self = this;
    if (!self.currentMenu) {
        self.currentMenu = self.createMenu('menu inner', self.menuItems);
        self.holder.appendChild(self.currentMenu);

        RadialMenu.nextTick(function () {
            self.currentMenu.setAttribute('class', 'menu');
        });
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.close = function () {
    var self = this;

    if (self.currentMenu) {
        $.post('http://goat_radialmenu/closeRadial');
        var parentMenu;
        while (parentMenu = self.parentMenu.pop()) {
            parentMenu.remove();
        }
        self.parentItems = [];

        RadialMenu.setClassAndWaitForTransition(self.currentMenu, 'menu inner').then(function () {
            if (self.currentMenu != null) {
                self.currentMenu.remove();
                self.currentMenu = null;
            }
        });
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.getParentMenu = function () {
    var self = this;
    if (self.parentMenu.length > 0) {
        return self.parentMenu[self.parentMenu.length - 1];
    } else {
        return null;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createHolder = function () {
    var self = this;

    self.holder = document.createElement('div');
    self.holder.className = 'menuHolder';
    self.holder.style.width  = self.size + 'px';
    self.holder.style.height = self.size + 'px';

    self.parent.appendChild(self.holder);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.showpzdMenu = function (item) {
    var self = this;
    self.parentMenu.push(self.currentMenu);
    self.parentItems.push(self.levelItems);
    self.currentMenu = self.createMenu('menu inner', item.items, true);
    self.holder.appendChild(self.currentMenu);

    // wait DOM commands to apply and then set class to allow transition to take effect
    RadialMenu.nextTick(function () {
        self.getParentMenu().setAttribute('class', 'menu outer');
        self.currentMenu.setAttribute('class', 'menu');
        self.onClick(item);
    });
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.returnToParentMenu = function () {
    var self = this;
    self.getParentMenu().setAttribute('class', 'menu');
    RadialMenu.setClassAndWaitForTransition(self.currentMenu, 'menu inner').then(function () {
        self.currentMenu.remove();
        self.currentMenu = self.parentMenu.pop();
        self.levelItems = self.parentItems.pop();
    });
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.handleClick = function (index) {
    var self = this;

    var selectedIndex = self.getSelectedIndex();
    if (index !== undefined) {
        selectedIndex = index - 1;
    }
    if (selectedIndex >= 0) {
        var item = self.levelItems[selectedIndex];
        if (self.levelItems[selectedIndex] != null) {
            if (item.items) {
                self.showpzdMenu(item);
            } else {
                if (self.onClick) {
                    self.onClick(item);
                }
            }
        }
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.handleCenterClick = function () {
    var self = this;
    if (self.parentItems.length > 0) {
        self.returnToParentMenu();
    } else {
        self.close();
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createCenter = function (svg, title, icon, size) {
    var self = this;
    size = size || 8;
    var g = document.createElementNS('http://www.w3.org/2000/svg', 'g');
    g.setAttribute('class', 'center');

    var centerCircle = self.createCircle(0, 0, self.innerRadius - self.sectorSpace);
    g.appendChild(centerCircle);
    if (text) {
        var text = self.createText(0,0, title);
        g.appendChild(text);
    }

    if (icon) {
        var use = self.createUseTag(0,0, icon);
        use.setAttribute('width', size);
        use.setAttribute('height', size);
        use.setAttribute('transform', 'translate(-' + RadialMenu.numberToString(size / 2) + ',-' + RadialMenu.numberToString(size / 2) + ')');
        g.appendChild(use);
    }

    svg.appendChild(g);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.getIndexOffset = function () {
    var self = this;
    if (self.levelItems.length < self.sectorCount) {
        switch (self.levelItems.length) {
            case 1:
                return -2;
            case 2:
                return -2;
            case 3:
                return -2;
            default:
                return -1;
        }
    } else {
        return -1;
    }

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createMenu = function (classValue, levelItems, pzd) {
    var self = this;

    var menuItems = 0;

    self.levelItems = levelItems;

    self.sectorCount = Math.max(self.levelItems.length, MIN_SECTORS);
    self.scale       = self.calcScale();

    var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
    svg.setAttribute('class', classValue);
    svg.setAttribute('viewBox', '-50 -50 100 100');
    svg.setAttribute('width', self.size);
    svg.setAttribute('height', self.size);

    var angleStep   = 360 / self.sectorCount;
    var angleShift

    for(i = 1; i < self.levelItems.length; i++) {
        menuItems = i
    }

    if (menuItems + 1 == 1) {
        angleShift = angleStep / 2 + 241;
    } else if (menuItems + 1 == 2) {
        angleShift = angleStep / 2 + 241;
    } else if (menuItems + 1 == 3) {
        angleShift = angleStep / 2 + 241;
    } else if (menuItems + 1 == 4) {
        angleShift = angleStep / 2 + 136;
    } else if (menuItems + 1 == 5) {
        angleShift = angleStep / 2 + 145;
    } else if (menuItems + 1 == 6) {
        angleShift = angleStep / 2 + 241;
    } else if (menuItems + 1 == 7) {
        angleShift = angleStep / 2 + 241;
    } else {
        angleShift = angleStep / 2 + 241;
    }

    var indexOffset = self.getIndexOffset();

    for (var i = 0; i < self.sectorCount; ++i) {
        var startAngle = angleShift + angleStep * i;
        var endAngle   = angleShift + angleStep * (i + 0.99);

        var itemIndex = RadialMenu.resolveLoopIndex(self.sectorCount - i + indexOffset, self.sectorCount);
        var item;
        if (itemIndex >= 0 && itemIndex < self.levelItems.length) {
            item = self.levelItems[itemIndex];
        } else {
            item = null;
        }

        self.appendSectorPath(startAngle, endAngle, svg, item, itemIndex);
    }

    if (pzd) {
        self.createCenter(svg, 'Close', '#return', 8);
    } else {
        self.createCenter(svg, 'Close', '#close', 7);
    }

    svg.addEventListener('mousedown', function (event) {
        var className = event.target.parentNode.getAttribute('class').split(' ')[0];
        switch (className) {
            case 'sector':
                var index = parseInt(event.target.parentNode.getAttribute('data-index'));
                if (!isNaN(index)) {
                    self.setSelectedIndex(index);
                }
                break;
            default:
        }
    });

    svg.addEventListener('click', function (event) {
        var className = event.target.parentNode.getAttribute('class').split(' ')[0];
        switch (className) {
            case 'sector':
                self.handleClick();
                audioClick.play();
                break;
            case 'center':
                self.handleCenterClick();
                audioClick.play();
                break;
            default:
        }
    });
    return svg;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.selectDelta = function (indexDelta) {
    var self = this;
    var selectedIndex = self.getSelectedIndex();
    if (selectedIndex < 0) {
        selectedIndex = 0;
    }
    selectedIndex += indexDelta;

    if (selectedIndex < 0) {
        selectedIndex = self.levelItems.length + selectedIndex;
    } else if (selectedIndex >= self.levelItems.length) {
        selectedIndex -= self.levelItems.length;
    }
    self.setSelectedIndex(selectedIndex);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.onKeyDown = function (event) {
    var self = this;
    if (self.currentMenu) {
        switch (event.key) {
            case 'Escape':
            case 'Backspace':
                self.handleCenterClick();
                event.preventDefault();
                break;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                var PressedKey = parseInt(event.key);
                self.handleClick(PressedKey);
                break;
        }
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.onMouseWheel = function (event) {
    var self = this;
    if (self.currentMenu) {
        var delta = -event.deltaY;

        if (delta > 0) {
            self.selectDelta(1)
        } else {
            self.selectDelta(-1)
        }
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.getSelectedNode = function () {
    var self = this;
    var items = self.currentMenu.getElementsByClassName('selected');
    if (items.length > 0) {
        return items[0];
    } else {
        return null;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.getSelectedIndex = function () {
    var self = this;
    var selectedNode = self.getSelectedNode();
    if (selectedNode) {
        return parseInt(selectedNode.getAttribute('data-index'));
    } else {
        return -1;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.setSelectedIndex = function (index) {
    var self = this;
    if (index >=0 && index < self.levelItems.length) {
        var items = self.currentMenu.querySelectorAll('g[data-index="' + index + '"]');
        if (items.length > 0) {
            var itemToSelect = items[0];
            var selectedNode = self.getSelectedNode();
            if (selectedNode) {
                selectedNode.setAttribute('class', 'sector');
            }
            itemToSelect.setAttribute('class', 'sector selected');
        }
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createUseTag = function (x, y, link) {
    var use = document.createElementNS('http://www.w3.org/2000/svg', 'use');
    use.setAttribute('x', RadialMenu.numberToString(x));
    use.setAttribute('y', RadialMenu.numberToString(y));
    use.setAttribute('width', '10');
    use.setAttribute('height', '10');
    use.setAttribute('fill', 'white');
    use.setAttributeNS('http://www.w3.org/1999/xlink', 'xlink:href', link);
    return use;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.appendSectorPath = function (startAngleDeg, endAngleDeg, svg, item, index) {
    var self = this;

    var centerPoint = self.getSectorCenter(startAngleDeg, endAngleDeg);
    var translate = {
        x: RadialMenu.numberToString((1 - self.scale) * centerPoint.x),
        y: RadialMenu.numberToString((1 - self.scale) * centerPoint.y)
    };

    var g = document.createElementNS('http://www.w3.org/2000/svg', 'g');
    g.setAttribute('transform','translate(' +translate.x + ' ,' + translate.y + ') scale(' + self.scale + ')');

    var path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path.setAttribute('d', self.createSectorCmds(startAngleDeg, endAngleDeg));
    g.appendChild(path);

    if (item) {
        g.setAttribute('class', 'sector');
        if (index == 0) {
            g.setAttribute('class', 'sector selected');
        }
        g.setAttribute('data-id', item.id);
        g.setAttribute('data-index', index);

        if (item.title) {
            var text = self.createText(centerPoint.x, centerPoint.y, item.title);
            if (item.icon) {
                text.setAttribute('transform', 'translate(0,8)');
            } else {
                text.setAttribute('transform', 'translate(0,2)');
            }

            g.appendChild(text);
        }

        if (item.icon) {
            var use = self.createUseTag(centerPoint.x, centerPoint.y, item.icon);
            if (item.title) {
                use.setAttribute('transform', 'translate(-5,-8)');
            } else {
                use.setAttribute('transform', 'translate(-5,-5)');
            }

            g.appendChild(use);
        }

    } else {
        g.setAttribute('class', 'dummy');
    }

    svg.appendChild(g);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createSectorCmds = function (startAngleDeg, endAngleDeg) {
    var self = this;

    var initPoint = RadialMenu.getDegreePos(startAngleDeg, self.radius);
    var path = 'M' + RadialMenu.pointToString(initPoint);

    var radiusAfterScale = self.radius * (1 / self.scale);
    path += 'A' + radiusAfterScale + ' ' + radiusAfterScale + ' 0 0 0' + RadialMenu.pointToString(RadialMenu.getDegreePos(endAngleDeg, self.radius));
    path += 'L' + RadialMenu.pointToString(RadialMenu.getDegreePos(endAngleDeg, self.innerRadius));

    var radiusDiff = self.radius - self.innerRadius;
    var radiusDelta = (radiusDiff - (radiusDiff * self.scale)) / 2;
    var innerRadius = (self.innerRadius + radiusDelta) * (1 / self.scale);
    path += 'A' + innerRadius + ' ' + innerRadius + ' 0 0 1 ' + RadialMenu.pointToString(RadialMenu.getDegreePos(startAngleDeg, self.innerRadius));
    path += 'Z';

    return path;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createText = function (x, y, title) {
    var self = this;
    var text = document.createElementNS('http://www.w3.org/2000/svg', 'text');
    text.setAttribute('text-anchor', 'middle');
    text.setAttribute('x', RadialMenu.numberToString(x));
    text.setAttribute('y', RadialMenu.numberToString(y));
    text.setAttribute('font-size', '.35vh');
    text.setAttribute('font-family', 'Poppins');
    text.innerHTML = title;
    return text;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.createCircle = function (x, y, r) {
    var circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
    circle.setAttribute('cx',RadialMenu.numberToString(x));
    circle.setAttribute('cy',RadialMenu.numberToString(y));
    circle.setAttribute('r',r);
    return circle;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.calcScale = function () {
    var self = this;
    var totalSpace = self.sectorSpace * self.sectorCount;
    var circleLength = Math.PI * 2 * self.radius;
    var radiusDelta = self.radius - (circleLength - totalSpace) / (Math.PI * 2);
    return (self.radius - radiusDelta) / self.radius;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.getSectorCenter = function (startAngleDeg, endAngleDeg) {
    var self = this;
    return RadialMenu.getDegreePos((startAngleDeg + endAngleDeg) / 2, self.innerRadius + (self.radius - self.innerRadius) / 2);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.prototype.addIconSymbols = function () {
    var self = this;
    var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
    svg.setAttribute('class', 'icons');

    // return
    var returnSymbol = document.createElementNS('http://www.w3.org/2000/svg', 'symbol');
    returnSymbol.setAttribute('id', 'return');
    returnSymbol.setAttribute('viewBox', '0 0 490.693 490.693');
    var returnPath =   document.createElementNS('http://www.w3.org/2000/svg', 'path');
    returnPath.setAttribute('d', "M351.173,149.227H36.4L124.827,60.8c4.053-4.267,3.947-10.987-0.213-15.04c-4.16-3.947-10.667-3.947-14.827,0 L3.12,152.427c-4.16,4.16-4.16,10.88,0,15.04l106.667,106.667c4.267,4.053,10.987,3.947,15.04-0.213 c3.947-4.16,3.947-10.667,0-14.827L36.4,170.56h314.773c65.173,0,118.187,57.387,118.187,128s-53.013,128-118.187,128h-94.827 c-5.333,0-10.133,3.84-10.88,9.067c-0.96,6.613,4.16,12.267,10.56,12.267h95.147c76.907,0,139.52-66.987,139.52-149.333 S428.08,149.227,351.173,149.227z");
    returnSymbol.appendChild(returnPath);
    svg.appendChild(returnSymbol);

    var closeSymbol = document.createElementNS('http://www.w3.org/2000/svg', 'symbol');
    closeSymbol.setAttribute('id', 'close');
    closeSymbol.setAttribute('viewBox', '0 0 24 24');

    var closePath = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    closePath.setAttribute('d', "M4.22676 4.22676C4.5291 3.92441 5.01929 3.92441 5.32163 4.22676L12 10.9051L18.6784 4.22676C18.9807 3.92441 19.4709 3.92441 19.7732 4.22676C20.0756 4.5291 20.0756 5.01929 19.7732 5.32163L13.0949 12L19.7732 18.6784C20.0756 18.9807 20.0756 19.4709 19.7732 19.7732C19.4709 20.0756 18.9807 20.0756 18.6784 19.7732L12 13.0949L5.32163 19.7732C5.01929 20.0756 4.5291 20.0756 4.22676 19.7732C3.92441 19.4709 3.92441 18.9807 4.22676 18.6784L10.9051 12L4.22676 5.32163C3.92441 5.01929 3.92441 4.5291 4.22676 4.22676Z");
    closeSymbol.appendChild(closePath);
    svg.appendChild(closeSymbol);

    self.holder.appendChild(svg);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.getDegreePos = function (angleDeg, length) {
    return {
        x: Math.sin(RadialMenu.degToRad(angleDeg)) * length,
        y: Math.cos(RadialMenu.degToRad(angleDeg)) * length
    };
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.pointToString = function (point) {
    return RadialMenu.numberToString(point.x) + ' ' + RadialMenu.numberToString(point.y);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.numberToString = function (n) {
    if (Number.isInteger(n)) {
        return n.toString();
    } else if (n) {
        var r = (+n).toFixed(5);
        if (r.match(/\./)) {
            r = r.replace(/\.?0+$/, '');
        }
        return r;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.resolveLoopIndex = function (index, length) {
    if (index < 0) {
        index = length + index;
    }
    if (index >= length) {
        index = index - length;
    }
    if (index < length) {
        return index;
    } else {
        return null;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.degToRad = function (deg) {
    return deg * (Math.PI / 180);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.setClassAndWaitForTransition = function (node, newClass) {
    return new Promise(function (resolve) {
        function handler(event) {
            if (event.target == node && event.propertyName == 'visibility') {
                node.removeEventListener('transitionend', handler);
                resolve();
            }
        }
        node.addEventListener('transitionend', handler);
        node.setAttribute('class', newClass);
    });
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RadialMenu.nextTick = function (fn) {
    setTimeout(fn, 10);
};