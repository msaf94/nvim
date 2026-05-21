local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescriptreact", {
	s(
		"rtfc",
		fmt(
			[[
export const {} = (props) => {{
    return (
        <div>{}</div>
    );
}};
    ]],
			{
				i(1, "ComponentName"),
				i(0),
			}
		)
	),
})

ls.add_snippets("typescriptreact", {
	s(
		"rtc",
		fmt(
			[[
import type {{ FC }} from 'react';
import React, {{ createContext, useContext, useMemo }} from 'react';

interface Props {{

}}

interface Context {{

}}

const {ctxName} = createContext<Context>({{}});

export const {hookName} = () => useContext({ctxName});

export const {providerName}: FC<Props> = ({{ children }}) => {{
    const ctxValue = useMemo<Context>(() => ({{}}), []);

    return <{ctxName}.Provider value={{ctxValue}}>{{ children }}</{ctxName}.Provider>;
}};
    ]],
			{
				ctxName = i(1, "Ctx"),
				hookName = i(2, "useMyContext"),
				providerName = i(3, "MyContextProvider"),
			},
			{ repeat_duplicates = false }
		)
	),
})
