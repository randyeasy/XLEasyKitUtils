//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "UIColor+XLEHSV.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
// Color algorithms from http://www.cs.rit.edu/~ncs/color/t_convert.html

#define XLEMAX3(a,b,c) (a > b ? (a > c ? a : c) : (b > c ? b : c))
#define XLEMIN3(a,b,c) (a < b ? (a < c ? a : c) : (b < c ? b : c))


///////////////////////////////////////////////////////////////////////////////////////////////////
void XLE_RGBtoHSV(CGFloat r, CGFloat g, CGFloat b, CGFloat* h, CGFloat* s, CGFloat* v) {
  CGFloat min, max, delta;
  min = XLEMIN3(r, g, b);
  max = XLEMAX3(r, g, b);
  *v = max;        // v
  delta = max - min;
  if ( max != 0 )
    *s = delta / max;    // s
  else {
    // r = g = b = 0    // s = 0, v is undefined
    *s = 0;
    *h = -1;
    return;
  }
  if ( r == max )
    *h = ( g - b ) / delta;    // between yellow & magenta
  else if ( g == max )
    *h = 2 + ( b - r ) / delta;  // between cyan & yellow
  else
    *h = 4 + ( r - g ) / delta;  // between magenta & cyan
  *h *= 60;        // degrees
  if ( *h < 0 )
    *h += 360;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void XLE_HSVtoRGB( CGFloat *r, CGFloat *g, CGFloat *b, CGFloat h, CGFloat s, CGFloat v ) {
  NSInteger i;
  CGFloat f, p, q, t;
  if ( s == 0 ) {
    // achromatic (grey)
    *r = *g = *b = v;
    return;
  }
  h /= 60;      // sector 0 to 5
  i = floor( h );
  f = h - i;      // factorial part of h
  p = v * ( 1 - s );
  q = v * ( 1 - s * f );
  t = v * ( 1 - s * ( 1 - f ) );
  switch( i ) {
    case 0:
      *r = v;
      *g = t;
      *b = p;
      break;
    case 1:
      *r = q;
      *g = v;
      *b = p;
      break;
    case 2:
      *r = p;
      *g = v;
      *b = t;
      break;
    case 3:
      *r = p;
      *g = q;
      *b = v;
      break;
    case 4:
      *r = t;
      *g = p;
      *b = v;
      break;
    default:    // case 5:
      *r = v;
      *g = p;
      *b = q;
      break;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * Additions.
 */

@implementation UIColor (XLEHSV)


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIColor*)XLE_colorWithHue:(CGFloat)h saturation:(CGFloat)s value:(CGFloat)v alpha:(CGFloat)a {
  CGFloat r, g, b;
  XLE_HSVtoRGB(&r, &g, &b, h, s, v);
  return [UIColor colorWithRed:r green:g blue:b alpha:a];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)XLE_multiplyHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat r = rgba[0];
  CGFloat g = rgba[1];
  CGFloat b = rgba[2];
  CGFloat a = rgba[3];

  CGFloat h, s, v;
  XLE_RGBtoHSV(r, g, b, &h, &s, &v);

  h *= hd;
  v *= vd;
  s *= sd;

  XLE_HSVtoRGB(&r, &g, &b, h, s, v);

  return [UIColor colorWithRed:r green:g blue:b alpha:a];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)XLE_copyWithAlpha:(CGFloat)newAlpha {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat r = rgba[0];
  CGFloat g = rgba[1];
  CGFloat b = rgba[2];

  return [UIColor colorWithRed:r green:g blue:b alpha:newAlpha];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)XLE_addHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat r = rgba[0];
  CGFloat g = rgba[1];
  CGFloat b = rgba[2];
  CGFloat a = rgba[3];

  CGFloat h, s, v;
  XLE_RGBtoHSV(r, g, b, &h, &s, &v);

  h += hd;
  v += vd;
  s += sd;

  XLE_HSVtoRGB(&r, &g, &b, h, s, v);

  return [UIColor colorWithRed:r green:g blue:b alpha:a];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)XLE_highlight {
  return [self XLE_multiplyHue:1 saturation:0.4 value:1.2];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)XLE_shadow {
  return [self XLE_multiplyHue:1 saturation:0.6 value:0.6];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)XLE_hue {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat h, s, v;
  XLE_RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
  return h;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)XLE_saturation {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat h, s, v;
  XLE_RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
  return s;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)XLE_value {
  const CGFloat* rgba = CGColorGetComponents(self.CGColor);
  CGFloat h, s, v;
  XLE_RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
  return v;
}


@end
