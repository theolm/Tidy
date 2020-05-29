String viewTemplate(String fileName, String bundle) => '''
package $bundle

import com.theomota.basemvplib.BaseView

interface ${fileName}View : BaseView {
}
''';

String presenterTemplate(String fileName, String bundle) => '''
package $bundle

import com.theomota.basemvplib.BasePresenter

class ${fileName}Presenter : BasePresenter<${fileName}View>() {
}
''';

String activityTemplate(String fileName, String bundle) => '''
package $bundle

import android.widget.Toast
import com.theomota.basemvplib.RootActivity

class ${fileName}Activity : RootActivity<${fileName}View>(), ${fileName}View {
    override val layoutResourceId: Int = R.layout.activity_${fileName.toLowerCase()}
    override val presenter: ${fileName}Presenter = ${fileName}Presenter()

    override fun initializePresenter() {
        presenter.start(this)
    }

    override fun initializeUI() {
        //TODO("not implemented")
    }

    override fun showError(messageId: Int) {
        Toast.makeText(this, messageId, Toast.LENGTH_SHORT).show()
    }

    override fun showError(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

}
''';

String layoutTemplate() => '''
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    >

</LinearLayout>
''';
