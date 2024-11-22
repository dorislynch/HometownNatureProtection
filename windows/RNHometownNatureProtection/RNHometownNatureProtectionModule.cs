using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Hometown.Nature.Protection.RNHometownNatureProtection
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNHometownNatureProtectionModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNHometownNatureProtectionModule"/>.
        /// </summary>
        internal RNHometownNatureProtectionModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNHometownNatureProtection";
            }
        }
    }
}
