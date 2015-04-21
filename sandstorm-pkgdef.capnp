@0xdd64070b2a0a30f9;

using Spk = import "/sandstorm/package.capnp";
using Util = import "/sandstorm/util.capnp";

const pkgdef :Spk.PackageDefinition = (
  id = "6va4cjamc21j0znf5h5rrgnv0rpyvh1vaxurkrgknefvj0x63ash",
  # Your app ID is actually its public key. The private key was placed in
  # your keyring. All updates must be signed with the same key.

  manifest = (
    appTitle = (defaultText = "gitweb"),
    appVersion = 1,  # Increment this for every release.

    actions = [
      ( title = (defaultText = "New GitWeb Repository"),
        command = .startCommand
      )
    ],

    continueCommand = .continueCommand
  ),

  sourceMap = (
    searchPath = [
      ( sourcePath = "." ),  # Search this directory first.
      ( sourcePath = "/",    # Then search the system root directory.
        hidePaths = [ "home", "proc", "sys",
                      "etc/nsswitch.conf", "etc/passwd", "etc/shadow", "etc/ssl/openssl.cnf"]
      )
    ]
  ),

  fileList = "sandstorm-files.list",

  alwaysInclude = [],

  bridgeConfig = (
    viewInfo = (
      permissions = [(name = "read"), (name = "write")],
      roles = [(title = (defaultText = "guest"),
                permissions = [true, false],
                verbPhrase = (defaultText = "can fetch")),
               (title = (defaultText = "developer"),
                permissions = [true, true],
                verbPhrase = (defaultText = "can fetch and push"))]
    )
  )
);

const commandEnvironment : List(Util.KeyValue) =
  [
    (key = "PATH", value = "/usr/local/bin:/usr/bin:/bin")
  ];

const startCommand :Spk.Manifest.Command = (
  argv = ["/sandstorm-http-bridge", "10000", "--", "/bin/sh", "start.sh"],
  environ = .commandEnvironment
);


const continueCommand :Spk.Manifest.Command = (
  argv = ["/sandstorm-http-bridge", "10000", "--", "/bin/sh", "continue.sh"],
  environ = .commandEnvironment
);
