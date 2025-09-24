module.exports = (sequelize, DataTypes) => {
  const Course = sequelize.define(
    "Course",
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      code: {
        type: DataTypes.STRING(10),
        allowNull: false,
        unique: true,
      },
      course_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      start_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
      },
      end_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
      },
      course_description: {
        type: DataTypes.TEXT,
      },
      credits: {
        type: DataTypes.INTEGER,
        defaultValue: 3,
      },
    },
    {
      tableName: "courses",
      timestamps: true, // createdAt & updatedAt
      underscored: true, // keep snake_case
    }
  );

  Course.associate = (models) => {
    Course.belongsToMany(models.Student, {
      through: models.Enrollment,
      foreignKey: "course_id",
    });
  };

  return Course;
};
