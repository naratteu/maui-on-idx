# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-25.05";
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.jdk17
    pkgs.dotnet-sdk_10
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "muhammad-sammy.csharp" # No space left on device..
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        workload = "
          dotnet workload config --update-mode workload-set
          dotnet workload update
          ";
        };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        restore = "
          dotnet workload restore
          dotnet build -f net10.0-android -t:InstallAndroidDependencies -p:AndroidSdkDirectory=/home/user/.androidsdkroot -p:AcceptAndroidSdkLicenses=True
          touch App.csproj # watch trigger ..
          ";
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        android = {
          command = ["dotnet" "watch" "--no-hot-reload" "-f" "net10.0-android" "/p:AdbTarget=-s emulator-5554"];
          manager = "flutter";
        };
      };
    };
  };
}
