require('blink.cmp').setup({
    completion = { -- completion window's setting
        menu = {
            border = 'rounded', -- 'single', 'double', 'rounded', 'solid', 'shadow'
            winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        },
        -- right window
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
                border = 'rounded',
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocSelection,Search:None',
            },
        },
    },

    signature = {
        enabled = true,
        window = { border = 'rounded' },
    },

	-- Use <tab> to select
	keymap = {
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
	},
})
