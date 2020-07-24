## Radio 单选框
单选按钮允许用户从多个选项中选择一个选项。单选框所有选项默认可见，方便用户在比较中选中，因此选项不宜过多。 选项至少2个，一般小于5个。

**应用场景**：用于多个备选项的选择，只能选择一个。

**交互方式**：鼠标单击选择，被选中项的单选按钮高亮，单选按钮默认为圆形。

<el-row :gutter="20">
  <el-col :span="10">
  未选择状态
  <br/><img class="demo-img" src="../../assets/images/radio/未选择状态.png" alt="未选择状态">
  </el-col>
  <el-col :span="10">
  鼠标悬浮状态
  <br/><img class="demo-img" src="../../assets/images/radio/鼠标悬浮状态.png" alt="鼠标悬浮状态">
  </el-col>
</el-row>
<el-row :gutter="20">
  <el-col :span="10">
  鼠标选中状态
  <br/><img class="demo-img" src="../../assets/images/radio/鼠标选中状态.png" alt="鼠标选中状态">
  </el-col>
  <el-col :span="10">
  禁用状态
  <br/><img class="demo-img" src="../../assets/images/radio/禁用状态.png" alt="禁用状态">
  </el-col>
</el-row>