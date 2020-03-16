import 'package:flutter/cupertino.dart';
import 'package:flutter_flavors/flavor_config.dart';

class FlavorBanner extends StatelessWidget {

  final Widget child;
  BannerConfig bannerConfig;

  FlavorBanner({@required this.child});

  @override
  Widget build(BuildContext context) {

    if(FlavorConfiguration.isProduction()) return child;

    bannerConfig ??= _getDefaultBanner();

    return Stack(
      children: <Widget>[
        child,
        _buildBanner(context)
      ],
    );

  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: FlavorConfiguration.singletonInstance.flavor.toString().split('.').last,
      bannerColor: FlavorConfiguration.singletonInstance.bannerColor
    );
  }

  Widget _buildBanner(BuildContext context) {

    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
          message: bannerConfig.bannerName,
          textDirection: Directionality.of(context),
          layoutDirection: Directionality.of(context),
          location: BannerLocation.topStart,
          color: bannerConfig.bannerColor
        ),
      ),
    );

  }

}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({@required this.bannerName, @required this.bannerColor});
}
