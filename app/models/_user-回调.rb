# 回调类
class PhoneVerifyCallback
  def self.after_create(record)
    puts "PhoneVerifyCallback"
  end
end

class User < ActiveRecord::Base
  # 创建对象
  # 执行顺序 before_validation -> after_validation -> before_save -> before_create -> (执行sql写入到数据库)
  # -> after_create -> after_save
  before_validation :before_validation
  after_validation :after_validation
  before_save :before_save, if: :test? # test?返回true才执行 before_save的回调
  def test?
    true
  end

  # 条件组合
  with_options if: :test? do
    before_create :before_create
    after_create :after_create, PhoneVerifyCallback
    after_save :after_save
  end

  # 更新对象
  # 执行顺序
  # before_validation -> after_validation -> before_save -> before_update -> (执行sql写入到数据库)
  # -> after_update -> after_save

  # 销毁对象
  # 执行顺序
  # before_destroy -> (执行sql销毁对象) -> after_destroy

  # 事务之后回调
  # after_commit
  # after_rollback # 新增或更新数据事务回滚时调用
  after_commit :after_commit # 创建或者更新事务完成后，回调after_commit
  # after_commit :after_commit, on: :create # 只有创建时候回调after_commit
  # after_commit :after_commit, on: :update # 只有更新时候回调after_commit

  after_rollback :after_rollback





  def before_validation
    puts 'before_validation'
    false
  end

  def after_validation
    puts 'after_validation'
  end

  def before_save
    puts 'before_save'
  end

  def before_create
    puts 'before_create'
  end

  def after_create
    puts 'after_create'
  end

  def after_save
    puts 'after_save'
  end

  def after_commit
    puts 'after_commit'
  end

  def after_rollback
    puts 'after_rollback'
  end

end


# 执行回调的函数
# create
# create!
# decrement!
# destroy
# destroy!
# destroy_all
# increment!
# save
# save!
# save(validate: false)
# toggle!
# update_attribute
# update
# update!
# valid?

# 跳过回调的方法
# decrement
# decrement_counter
# delete
# delete_all
# increment
# increment_counter
# toggle
# touch
# update_column
# update_columns
# update_all
# update_counters

# 终止回调
# before_*
#   - 返回false
#   - 抛出异常
# after_*
#   - 抛出异常