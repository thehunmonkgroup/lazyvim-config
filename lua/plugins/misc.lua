return {
  {
    "saltstack/salt-vim",
    ft = "sls",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "Glench/Vim-Jinja2-Syntax",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "jinja", "jinja2" },
  },
  {
    "tolecnal/icinga2-vim",
    event = { "BufReadPre", "BufNewFile" },
    ft = "icinga2",
  },
  {
    "nfnty/vim-nftables",
    event = { "BufReadPre", "BufNewFile" },
    ft = "nftables",
  },
  {
    "hashivim/vim-terraform",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "terraform", "tf", "hcl" },
  },
  {
    "markuskimius/applescript-vim",
    event = { "BufReadPre", "BufNewFile" },
    ft = "applescript",
  },
  {
    "vimoutliner/vimoutliner",
    event = { "BufReadPre", "BufNewFile" },
    ft = "votl",
  },
  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "farmergreg/vim-lastplace",
    event = { "BufReadPre", "BufNewFile" },
  },
}
