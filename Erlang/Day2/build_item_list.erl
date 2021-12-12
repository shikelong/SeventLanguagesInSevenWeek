% 考虑形如[{item quantity price}, ...]的购物列表。写一个列表解析，构建形如
% [{item total_price}, ...]的商品列表，其中total_price是quantity乘以price。
-module(build_item_list).
-export([build/1]).

build(L) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- L].
