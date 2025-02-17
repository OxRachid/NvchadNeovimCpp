local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		c_cpp = { "clang-format" }, -- Hack to force download.
		c = { "clang_format" },
		cpp = { "clang_format" },
		sh = { "shfmt" }, -- Add shfmt for sh files
		bash = { "shfmt" }, -- Add shfmt for bash files
		python = { "isort", "black" },
	},

	formatters = {
		-- C/Cpp
		clang_format = {
			prepend_args = {
				"-style={ \
                BasedOnStyle: LLVM, \
                IndentWidth: 4, \
                TabWidth: 4, \
                UseTab: Never, \
                AlwaysBreakAfterReturnType: None, \
                AlwaysBreakAfterDefinitionReturnType: None, \
                BreakConstructorInitializers: BeforeComma, \
                PenaltyBreakBeforeFirstCallParameter: 100, \
                AccessModifierOffset: 0, \
                IndentAccessModifiers: true, \
                PackConstructorInitializers: Never, \
                IndentCaseLabels: true, \
                NamespaceIndentation: All, \
                PenaltyBreakString: 1000, \
                PenaltyExcessCharacter: 1000000, \
                ColumnLimit: 0, \
                AllowShortFunctionsOnASingleLine: Empty, \
                AllowShortEnumsOnASingleLine: false, \
                AllowShortLambdasOnASingleLine: Empty, \
                BinPackArguments: false, \
                BinPackParameters: false, \
                AllowAllArgumentsOnNextLine: false, \
                AllowAllParametersOfDeclarationOnNextLine: true, \
                AlignAfterOpenBracket: DontAlign, \
                AlignOperands: Align}",
			},
		},
		-- Bash - zsh
		shfmt = {
			prepend_args = {
				"-i",
				"4", -- Use 4 spaces for indentation
				"-ci", -- Indent switch cases
			},
		},
		-- Python
		black = {
			prepend_args = {
				"--fast",
				"--line-length",
				"150",
			},
		},
		isort = {
			prepend_args = {
				"--profile",
				"black",
			},
		},
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 2000,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
